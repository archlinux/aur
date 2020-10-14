# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=2.1.2
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python' 'python-setuptools')
options=('!emptydirs')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('57ad1d3c804d46ed53266e18e56625e4b30307315c5301fbfe1c9b473908df2aee8f900885f443e193e4ec7fce24dcec23f532cb56b75db16394570dfd42f57e')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
