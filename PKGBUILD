# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-gcld3
pkgver=3.0.13
pkgrel=1
pkgdesc="CLD3 is a neural network model for language identification."
url="https://github.com/google/cld3"
arch=('i686' 'x86_64')
provides=('python-gcld3')
depends=('python')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('47c8c779bfe7372a38564b0cd357556dc362aec81cb55b0c889059e8b952e959')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
