# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=emoj
pkgver=4.2.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/${pkgname}"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('fb959269863eedf779ad74f0e64ec7aa5ddf4372ac3d8d603b631a6a97cef48f')

package() {
  install -dm 755 "${pkgdir}/usr/lib/node_modules/"
  cd "${pkgdir}/usr/lib/node_modules/"
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
}
