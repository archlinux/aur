# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pkgname=pyclipper
pkgname="python-${_pkgname}"
pkgver=1.2.1
pkgrel=1
pkgdesc='Cython wrapper for the C++ translation of the Angus Johnson’s Clipper library'
url="https://github.com/fonttools/$_pkgname"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('ca3751e93559f0438969c46f17459d07f983281dac170c3479de56492e152855')

package_python-pyclipper() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
