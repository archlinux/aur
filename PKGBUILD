# Maintainer : Zihad <aur@zihad.dev>

pkgname=kunkun-bin
pkgver=0.1.29
pkgrel=1
pkgdesc='An open source, cross-platform, extensible app launcher.'
url='https://kunkun.sh/'
license=('LicenseRef-custom')
arch=('x86_64')
provides=('kunkun')
# depends=(glib2 dbus hicolor-icon-theme glibc gcc-libs libx11 gdk-pixbuf2 pango cairo gtk3 xdotool libsoup3 libxtst)
depends=(libappindicator-gtk3 webkit2gtk-4.1 gtk3 xdotool "org.freedesktop.secrets")
optdepends=()

options=('!strip')

source=("$pkgname-$pkgver.deb::https://github.com/kunkunsh/kunkun/releases/download/Kunkun-v$pkgver/kunkun_${pkgver}_amd64.deb" "LICENSE::https://github.com/kunkunsh/kunkun/raw/develop/LICENSE")
sha256sums=("99fbabf1aa1b5f8a8a1c7d34d73b1642e0d85d6310b048c7a964e366413a58f7" "SKIP")
install="$pkgname.install"

package() {
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
