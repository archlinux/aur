# Maintainer : Zihad <aur@zihad.dev>

pkgname=kunkun-bin
pkgver=0.1.22
pkgrel=2
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
sha256sums=("ccd0464d8e832dd217245d5cca98e8c13dfc7380988004cf6ad5fa8777d1e38b" "SKIP")

package() {
    tar xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
