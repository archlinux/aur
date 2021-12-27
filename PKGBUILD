# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=cligj
pkgname=('python2-cligj')
pkgver=0.7.2
pkgrel=1
pkgdesc="Click params for commmand line interfaces to GeoJSON (Python 2.7)"
arch=('any')
url='https://github.com/mapbox/cligj'
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2-click')
options=(!emptydirs)
sha256sums=('a4bc13d623356b373c2c27c53dbd9c68cae5d526270bfa71f6c6fa69669c6b27'
            '5902d716544ddf9a34849b345c391abaf7c21ca16ed22706d6ac2f5503712594')
_pypi='https://pypi.python.org/packages'
_path='ea/0d/837dbd5d8430fd0f01ed72c4cfb2f548180f4c68c635df84ce87956cff32'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/mapbox/cligj/$pkgver/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
