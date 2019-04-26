# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.3.4
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit>=0.1.1' 'python-rchitect>=0.2.3' 'python-rchitect<0.3.0' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pyte' 'python-pexpect' 'python-ptyprocess')
replaces=('rtichoke')
source=("$pkgname-$pkgver.tar.gz::https://github.com/randy3k/radian/archive/v$pkgver.tar.gz")
sha256sums=('dc7c8b58d7d5b0a553d3a24ff46912d2e3748b5fbe8a435569b3c8a9cb2ee729')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
