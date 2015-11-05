# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-counterparty-lib
pkgver=9.52.0
pkgrel=1
pkgdesc="Counterparty Protocol Reference Implementation"
arch=('any')
depends=('python'
         'python-appdirs'
         'python-apsw'
         'python-colorlog'
         'python-crypto'
         'python-dateutil'
         'python-flask'
         'python-flask-httpauth'
         'python-json-rpc'
         'python-pycoin'
         'python-pysha3'
         'python-python-bitcoinlib'
         'python-requests'
         'python-tendo'
         'python-tornado'
         'python-xmltodict'
         'sqlite')
makedepends=('python-setuptools')
optdepends=('ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-lib"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterparty-lib/tar.gz/$pkgver)
sha256sums=('3c2f2d6a7925a9d08295f4d8a9c406c1331e1df8afc05523a62bf08a9546ac77')

build() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname#python-}-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
