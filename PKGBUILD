# Maintainer: Francisco Giordano <frangio.1@gmail.com>
pkgname=truffle
pkgver=4.0.4
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
sha1sums=('b447cb3b0469054413b5ff421f6e8baeefddb2be')
provides=('truffle')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "truffle-${pkgver}.tgz"
  tar -xf "truffle-${pkgver}.tgz" package/LICENSE
  install -D -m644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
