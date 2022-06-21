# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=emoj
pkgver=3.2.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/${pkgname}"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/${pkgname}/archive/v${pkgver}.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha256sums=('68e41facffe3abcdee0e753564349d5b543c1b22556ab645a83b4af641683c86')

package() {
  install -dm 755 "${pkgdir}/usr/lib/node_modules/"
  cd "${pkgdir}/usr/lib/node_modules/"
  npm install -g --prefix "${pkgdir}/usr" ${pkgname}@${pkgver}
}
