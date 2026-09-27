# Maintainer: Timothée Andres <andres.timothee+aur@gmail.com>
# Contributor: Nikoloz Shvelidze <shveloo@gmail.com>
pkgname=chronicler-bin
pkgver=0.61.0_alpha
pkgrel=1
pkgdesc="The free offline worldbuilding tool for writers and GMs."
arch=('x86_64')
license=('LicenseRef-PolyForm-Shield-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'libgcc' 'libsoup3' 'hicolor-icon-theme' 'glibc' 'glib2' 'dbus' 'cairo')
provides=('chronicler')
conflicts=()
url="https://github.com/mak-kirkland/${pkgname%-*}"
source=(
    "${pkgname}_${pkgver}_amd64.deb::https://github.com/mak-kirkland/${pkgname%-*}/releases/download/v${pkgver//_/-}/Chronicler_${pkgver%_*}_amd64.deb"
    "LICENSE-${pkgname}_${pkgver}::https://raw.githubusercontent.com/mak-kirkland/${pkgname%-*}/v${pkgver//_/-}/LICENSE"
)
sha256sums=('10b2679a1c486e8f1a39f00211d9c471a6e2f444c1941ff7ee0f9044537c3144'
            '4b4b7f846a2a8865f82a40eb0c475f534c9c044bd202536ad35e1060bd27dc5d')


prepare() {
    ar x ${pkgname}_${pkgver}_amd64.deb
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 $srcdir/LICENSE-${pkgname}_${pkgver} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    tar xzf $srcdir/data.tar.gz -C $pkgdir
}
