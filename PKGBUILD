# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle
pkgver=3.4.3
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/trufflesuite/truffle'
arch=('any')
license=('MIT')
source=("https://github.com/trufflesuite/truffle/archive/v${pkgver}.tar.gz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
md5sums=('9ab95a71ee53f47dd2c0f6b103b3f535')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: testing support'
            'geth: contract deployment'
            'parity: contract deployment')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
