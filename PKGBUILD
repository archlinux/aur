# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=emoj
pkgver=4.1.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/${pkgname}"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('7718b1e2487368db77a46453aa682d840645511861e1d00192cde8e8332dffca')

package() {
  install -dm 755 "${pkgdir}/usr/lib/node_modules/"
  cd "${pkgdir}/usr/lib/node_modules/"
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
}
