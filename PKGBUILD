# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=affine
pkgname=('python2-affine')
pkgver=2.2.1
pkgrel=1
pkgdesc="Matrices describing affine transformation of the plane (Python 2.7)"
arch=('any')
url='https://github.com/sgillies/affine'
license=('BSD')
makedepends=('python2-setuptools')
options=(!emptydirs)
sha256sums=('306e56e8e2cbe80e90400fe0469cfc09c583a9efc7796c3fa87bcb572ddb7548'
            'fc3636b54ff4072cf4b013ed9893c171ed25f88dae2b32722050499c1878cd6e')
_pypi='https://files.pythonhosted.org/packages'
_path='38/88/ee5dcab77799b8eb226b7170d6e65e3031420edf63ce1f4f05296e50378f'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/sgillies/affine/$pkgver/LICENSE.txt")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE.txt \
                 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
