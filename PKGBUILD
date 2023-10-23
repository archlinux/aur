# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=emoj
pkgver=4.0.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/${pkgname}"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('dbb0aa2c031af0f177ab73c65956a3b6b995e1cfd244203807715d3d8dc2fe62')

package() {
  install -dm 755 "${pkgdir}/usr/lib/node_modules/"
  cd "${pkgdir}/usr/lib/node_modules/"
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
}
