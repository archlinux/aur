# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=cligj
pkgname=('python2-cligj')
pkgver=0.4.0
pkgrel=1
pkgdesc="Click params for commmand line interfaces to GeoJSON (Python 2.7)"
arch=('any')
url='https://github.com/mapbox/cligj'
license=('BSD')
makedepends=('python2-setuptools')
depends=('python2-click')
options=(!emptydirs)
md5sums=('b1be9e2e9a083e8ab114901645a83826'
         '4059ec060d17347f4fbdd59fb7029f09')
_pypi='https://pypi.python.org/packages'
_path='fc/53/b89c392f33aa48b3063ad49e4dab70e424659d1fc4103b28b183f477f476'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz#md5=$md5sums"
        "https://raw.githubusercontent.com/mapbox/cligj/$pkgver/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
