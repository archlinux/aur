# Maintainer: Francisco Giordano <frangio.1@gmail.com>
pkgname=truffle
pkgver=4.0.1
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
sha1sums=('d8661a4ad7a6ca094b7517d29b199c60e6dde665')
provides=('truffle')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "truffle-${pkgver}.tgz"
  tar -xf "truffle-${pkgver}.tgz" package/LICENSE
  install -D -m644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
