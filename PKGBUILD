# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=radian
pkgver=0.3.1
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/radian"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit>=0.1.1' 'python-rchitect>=0.2.3' 'python-six')
makedepends=('python-setuptools')
replaces=('rtichoke')
source=("https://github.com/randy3k/radian/archive/v$pkgver.tar.gz")
sha256sums=('efd76d311dec437fa6363409fc068ed4eb442992f2779516f23e45956707959e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
