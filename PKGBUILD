# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Falk Höppner <falk hoppner se>

pkgname=qbittorrent-vuetorrent-bin
_pkgname=vuetorrent
pkgver=1.0.1
pkgrel=1
pkgdesc='The sleekest looking WebUI for qBittorrent made with Vue.js!'
arch=('any')
url='https://github.com/WDaan/VueTorrent'
license=('GPL3')
provides=("qbittorrent-${_pkgname}")
conflicts=("qbittorrent-${_pkgname}")
optdepends=(
    'qbittorrent: for use with qbittorrent'
    'qbittorrent-nox: for use with qbittorrent-nox'
)
install=qbittorrent-vuetorrent.install
source=("${_pkgname}-$pkgver.zip::https://github.com/WDaan/VueTorrent/releases/download/v$pkgver/${_pkgname}.zip")
sha512sums=('f352788b8f9d7a8017999dfd7e5232abfb38e3e64cd77970ed44e25595011337f6fa12f61e774aaee59c155caa9345bbd7a1c3ba0de1ce84eab5f6c3aa1100b9')

package() {
    cd "$srcdir/vuetorrent"
    find . -type f -exec install -D '{}' "$pkgdir/usr/share/$pkgname/{}" ';'
}
# vim:set ts=2 sw=2 et:
