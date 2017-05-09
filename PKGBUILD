# Maintainer: TrekDev <trekdev0 at gmail dot com>
pkgname=truffle
pkgver=3.2.2
pkgrel=1
pkgdesc='A development framework for Ethereum'
url='https://github.com/ConsenSys/truffle'
arch=('any')
license=('MIT')
source=("https://github.com/ConsenSys/truffle/archive/v${pkgver}.tar.gz")
makedepends=('npm')
depends=('nodejs')
conflicts=('truffle-git')
md5sums=('a7dbc8bc497ae9ebddca478b04f9fd66')
provides=('truffle')
optdepends=('mocha: testing support'
            'testrpc: contract deployment'
            'geth: contract deployment')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm install -g --prefix "$pkgdir/usr"
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
