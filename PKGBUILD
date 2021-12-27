# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=affine
pkgname=('python2-affine')
pkgver=2.3.0
pkgrel=1
pkgdesc="Matrices describing affine transformation of the plane (Python 2.7)"
arch=('any')
url='https://github.com/sgillies/affine'
license=('BSD')
makedepends=('python2-setuptools')
options=(!emptydirs)
sha256sums=('2e045def1aa29e613c42e801a7e10e0b9bacfed1a7c6af0cadf8843530a15102'
            'fc3636b54ff4072cf4b013ed9893c171ed25f88dae2b32722050499c1878cd6e')
_pypi='https://files.pythonhosted.org/packages'
_path='93/73/2467d77542b3125a2ebb9c1fccf19bc8621847178619984fabc24810a389'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/sgillies/affine/$pkgver/LICENSE.txt")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
