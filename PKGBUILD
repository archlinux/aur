# Maintainer: Joidy App <https://github.com/Axel-DaMage/joidy>
pkgname=joidy
pkgver=1.0.0-test.5
pkgrel=1
pkgdesc="Personal knowledge management with gamification"
arch=('any')
url="https://joidy-web.vercel.app"
license=('GPL3')
depends=('docker' 'docker-compose')
source=("https://github.com/Axel-DaMage/joidy/archive/v${pkgver}.tar.gz")
sha256sums=('90fa908abeb9ae6a0835ba1a50d121d0d8391331bc1424c0a9938dd1eb091ee8')

package() {
  cd "${srcdir}/joidy-${pkgver}"
  install -Dm755 bin/joidy "${pkgdir}/usr/bin/joidy"
  install -Dm644 docker-compose.yml "${pkgdir}/usr/share/joidy/docker-compose.yml"
  install -Dm644 .env.example "${pkgdir}/usr/share/joidy/.env.example"
}
