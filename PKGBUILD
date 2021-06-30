# Maintainer: 'Sergey Malkin <adresatt@gmail.com>'
pkgname=python-pyabf
_pkgname=pyabf
pkgver=2.3.1
pkgrel=1
pkgdesc="A Python interface to files in the Axon Binary Format (ABF)"
url="https://github.com/swharden/pyABF"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-numpy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/f9/0a/7283eacc38a999a90f78da4e43fbe3bd2d47de34f70d0072ef6a467288ff/$_pkgname-$pkgver.tar.gz")
sha256sums=('5447b3f09a5c5bac97a311f4873ffb0e26afbff7cc1da8a2d7c2ca05e40de451')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
