# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle
pkgver=3.4.6
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/trufflesuite/truffle'
arch=('any')
license=('MIT')
source=("https://github.com/trufflesuite/truffle/archive/v${pkgver}.tar.gz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
md5sums=('562468b53024652821cd5b0f13f4d40a')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: testing support'
            'geth: contract deployment'
            'parity: contract deployment')

package() {
  npm install -g --production --prefix "$pkgdir/usr" "v${pkgver}.tar.gz"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
