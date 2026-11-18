# Maintainer: agony <27015 at riseup dot net>

pkgname=rutorrent-theme-dracula
pkgver=0.3.4
pkgrel=1
pkgdesc='Dracula dark theme for ruTorrent'
arch=('any')
url='https://github.com/dracula/rutorrent'
license=('MIT')
depends=('rutorrent')
checkdepends=('nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a16d8f6d9592c1a71d94ccaac9dabb2ac71a0e9156c1246f1cde8e77ac40280d')

check() {
  cd "rutorrent-${pkgver}"
  node --test --test-reporter=dot
}

package() {
  cd "rutorrent-${pkgver}"
  install -d "${pkgdir}/usr/share/webapps/rutorrent/plugins/theme/themes"
  cp -r Dracula "${pkgdir}/usr/share/webapps/rutorrent/plugins/theme/themes/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
