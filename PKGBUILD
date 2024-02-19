# Maintainer: Yardena Cohen <yardenack at gmail com>
# Based on a PKGBUILD by: Rich Li <rich at dranek com>

pkgname=python-pyshp
_pkgname=pyshp
pkgver=2.3.1
pkgrel=1
pkgdesc="Python read/write support for ESRI Shapefile format"
arch=('any')
url="https://github.com/GeospatialPython/${_pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('08844492b8d1d824c639844f7f314909d946bd4d3703a4f8d4cb64d400729671b42ff5b0f80aa68d9469f3939a3c7619ba13c9efdcba3b244ec01d7be3a371c5')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
