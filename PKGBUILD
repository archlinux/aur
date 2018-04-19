# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=rtichoke
pkgver=0.1.1
pkgrel=2
pkgdesc="A 21 century R console"
url="https://github.com/randy3k/rtichoke"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>=3.4.0' 'python-pygments' 'python-wcwidth')
makedepends=('python-setuptools')
source=("https://github.com/randy3k/rtichoke/archive/v0.1.1.tar.gz")
md5sums=('e47995fe5df5440b9b63be00f64bebf6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

#  pydir=$(python -c "from distutils.sysconfig import get_python_lib; \
#    print(get_python_lib())")
#  install -m755 "$srcdir"/llvmlite-$pkgver/ffi/libllvmlite.so \
#    "$pkgdir/$pydir"/llvmlite/binding
}
