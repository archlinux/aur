#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=p5
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Python package based on the core ideas of Processing"
url="https://github.com/p5py/p5"
arch=('any')
license=('GPL3')
depends=('python' 'glfw' 'python-numpy' 'python-vispy')
provides=("python-p5")
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/81/e7/f6baed714475b6368c8311a159a3410cc5701b7d0a7aaca163a9c3686033/${_pkgname}-${pkgver}.tar.gz")

sha256sums=('4977a9d1b1690d273d8fa4442e5382d61aa344492bf14e0b606dbd86a9add328')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

