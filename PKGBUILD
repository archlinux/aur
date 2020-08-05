# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=Unipath
pkgname=python-unipath
pkgver=1.1
pkgrel=1
pkgdesc="Object-oriented alternative to os/os.path/shutil"
arch=('any')
url="https://github.com/mikeorr/Unipath"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('09839adcc72e8a24d4f76d63656f30b5a1f721fc40c9bcd79d8c67bdd8b47dae')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}