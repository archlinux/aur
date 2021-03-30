# Maintainer: Kenny MacDermid <kenny.macdermid@gmail.com>
pkgname=python-toolrack
_name=toolrack
pkgver=3.0.1
pkgrel=1
pkgdesc="A collection of utility functions and classes, and a few scripts too."
arch=('any')
url="https://github.com/albertodonato/sshoot"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('e14c28c229b6ab49a53773db7bfc9525c4631e7538823dd9af9966dbfaecc5a1')
sha512sums=('e02cc201a0b0d9f9d8525172e50365c8b91fc9fe5046624894af6174553304c9f45077b5476abf16ac07dd4e05d227f7c162a98c185f89acaa3d6715ee250a92')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
