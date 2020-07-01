# Maintainer: grandchild
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=python-pyclipper
_pkgname=pyclipper
pkgname=("python-${_pkgname}" "python2-${_pkgname}")
pkgver=1.2.0
pkgrel=1
pkgdesc="Cython wrapper for the C++ translation of the Angus Johnson's Clipper library"
url="https://github.com/fonttools/pyclipper"
arch=(i686 x86_64)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.zip")
sha256sums=('7a9035ca6732dcef3ef33f98d9a844bb5f2be16bd659300c38ef366aac2e3a47')

package_python-pyclipper() {
  depends=('python')
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

package_python2-pyclipper() {
  depends=('python2')
  cd "$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
