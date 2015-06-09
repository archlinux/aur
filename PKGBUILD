# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-gui
pkgver=1.0.0.BETA
pkgrel=1
pkgdesc="An open marketplace, built on Bitcoin"
arch=('any')
depends=('counterparty-cli'
         'python'
         'python-appdirs'
         'python-pyqt5'
         'python-requests')
makedepends=('git'
             'python-setuptools')
optdepends=('bitcoin-headless-addrindex: Bitcoin headless wallet with addrindex'
            'bitcoin-qt-addrindex: Bitcoin QT wallet with addrindex'
            'btcwallet: HD Bitcoin thin client written in Go'
            'electrum: HD Bitcoin thin client written in Python')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-gui"
license=('MIT')
options=(!emptydirs)
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/$pkgname/tar.gz/v1.0.0-BETA)
sha256sums=('56d2d00ff32a7c504750f6c6e116a571974c07fabe9216c9c7bb4f9ebc73a251')

build() {
  cd "$srcdir/$pkgname-1.0.0-BETA"

  msg 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-1.0.0-BETA"

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
