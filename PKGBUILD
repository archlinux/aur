# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=qhangups
pkgver=1.6.0
pkgrel=1
pkgdesc="Alternative client for Google Hangouts written in PyQt"
arch=('any')
url="https://github.com/xmikos/qhangups"
license=('GPL3')
depends=('hangups-git' 'python-quamash' 'python-pyqt4' 'python-appdirs')
makedepends=('python-setuptools')
source=(https://github.com/xmikos/qhangups/archive/v$pkgver.tar.gz)
md5sums=('fe96c8a8ae206fcb0668ebe5b22417db')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^.*asyncio.*$//' setup.py
  python setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
