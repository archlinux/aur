# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=rtichoke
pkgver=0.2.12
pkgrel=1
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/rtichoke"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-lineedit>=0.1.1' 'python-rapi>=0.1.2')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/rtichoke/archive/v$pkgver.tar.gz")
sha256sums=('9936a374da26648117e6b0f103e23d44079843b5d15b7e34dcc8912b7df7e110')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
