# Maintainer: Francisco Giordano <frangio.1@gmail.com>
pkgname=truffle
pkgver=4.1.8
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/trufflesuite/truffle'
arch=('any')
license=('MIT')
source=("https://registry.npmjs.org/truffle/-/truffle-${pkgver}.tgz")
noextract=("truffle-${pkgver}.tgz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
sha1sums=('b0b9175e0270145999567a3f0a2337c914a23a9c')
provides=('truffle')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "truffle-${pkgver}.tgz"
  tar -xf "truffle-${pkgver}.tgz" package/LICENSE
  install -D -m644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
