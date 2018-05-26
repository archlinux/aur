# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=affine
pkgname=('python2-affine')
pkgver=2.2.0
pkgrel=1
pkgdesc="Matrices describing affine transformation of the plane (Python 2.7)"
arch=('any')
url='https://github.com/sgillies/affine'
license=('BSD')
makedepends=('python2-setuptools')
options=(!emptydirs)
sha256sums=('0e56a6aaf8443366042daa4092a94907c18edf5aba22db9f5e47737b222f4b91'
            'fc3636b54ff4072cf4b013ed9893c171ed25f88dae2b32722050499c1878cd6e')
_pypi='https://files.pythonhosted.org/packages'
_path='0b/31/750da34024e1a8075cede04134789943ff166dc26ea192804bbf24194547'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/sgillies/affine/$pkgver/LICENSE.txt")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
