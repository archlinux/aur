# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle
pkgver=3.2.1
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/ConsenSys/truffle'
arch=('any')
license=('MIT')
source=("https://github.com/ConsenSys/truffle/archive/v${pkgver}.tar.gz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
md5sums=('e968dc5ae17c009fde3331f48869a2bd')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: contract deployment'
            'geth: contract deployment')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install -g --prefix "$pkgdir/usr"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
