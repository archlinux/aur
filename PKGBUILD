# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-pycld2
pkgver=0.41
pkgrel=3
pkgdesc="Python bindings for the Compact Langauge Detect 2 (CLD2)"
url="https://github.com/aboSamoor/pycld2"
arch=('i686' 'x86_64')
provides=('python-pycld2')
depends=('python')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a42f6e974df8fdd70685c2baa8a9f523069a260e1140ce604fb9f1fb6c3064df')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
