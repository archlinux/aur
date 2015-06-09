# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-cli
pkgver=1.1.1
pkgrel=1
pkgdesc="Counterparty Protocol Command‐Line Interface"
arch=('any')
depends=('python'
         'python-appdirs'
         'python-colorlog'
         'python-counterparty-lib'
         'python-dateutil'
         'python-prettytable'
         'python-requests')
makedepends=('python-setuptools')
optdepends=('bitcoin-core-addrindex: Bitcoin Core headless P2P node with addrindex'
            'bitcoin-headless-addrindex: Bitcoin headless wallet with addrindex'
            'bitcoin-qt-addrindex: Bitcoin-QT wallet with addrindex'
            'ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-cli"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/$pkgname/tar.gz/v$pkgver)
sha256sums=('2bf762c1fb9f89ef35c5d0fe73d45de6c7f704a5500432e5432af24c9971fe90')
provides=('counterparty-cli' 'counterparty-client' 'counterparty-server')
conflicts=('counterparty-client' 'counterparty-server')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
