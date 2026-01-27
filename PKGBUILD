# Maintainer: ThePanz <thepanz@gmail.com>

pkgname=atuin-desktop-bin
pkgver=0.2.18
pkgrel=1
pkgdesc="Atuin Desktop: Runbooks that Run. A local-first, executable runbook editor for real terminal workflows"
arch=('x86_64')
url="https://github.com/atuinsh/desktop"
license=('Apache-2.0')
depends=(
    "cairo"
    "dbus"
    "fontconfig"
    "gcc-libs"
    "gdk-pixbuf2"
    "glib2"
    "glibc"
    "gtk3"
    "hicolor-icon-theme"
    "libsoup3"
    "pango"
    "webkit2gtk-4.1"
    "zlib"
)
makedepends=()
options=("!debug")

provides=("${pkgname%-bin}")

source_x86_64=(
    "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/Atuin_Desktop-${pkgver}-1.${CARCH}.rpm"
    "LICENSE::https://raw.githubusercontent.com/atuinsh/desktop/main/LICENSE"
)

package() {
    cp -ar "${srcdir}/usr/" "${pkgdir}/usr/"
    install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

b2sums_x86_64=('1ff071e005aa68c7f8902e142506983b131e2713e70d2ae27aa3abfe077d8c43605991460fd051e3fd2b6d58c9466cdb5ec86edf65977d981ca205163d6455be'
               '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')

# vim:set ts=2 sw=2 et:
