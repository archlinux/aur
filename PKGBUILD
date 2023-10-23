# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=emoj
pkgver=4.0.1
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/${pkgname}"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('e16a5097d22b722a9bd0743beb22af9c9716ec4d9ce5a25953cd25c2b57c10d0')

package() {
  install -dm 755 "${pkgdir}/usr/lib/node_modules/"
  cd "${pkgdir}/usr/lib/node_modules/"
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
}
