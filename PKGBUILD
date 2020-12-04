# Maintainer: Mark Wells (halfhorn) <mwellsa at gmail dot com>
pkgname=python-phoebe
pkgver=2.3.7
pkgrel=1
pkgdesc="An eclipsing binary modeling code - reproducing and fitting light curves, radial velocity curves, and spectral line profiles of eclipsing systems."
arch=(any)
url="http://phoebe-project.org"
license=('GPL3')
depends=('gcc-libs'
         'clang'
         'python'
         'python-numpy>=1.10.0'
         'python-scipy>=1.2.0'
         'python-astropy>=1.0.0'
         'python-requests'
         'python-socketio-client'
         'python-matplotlib'
         'python-corner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/phoebe-project/phoebe2/archive/$pkgver.tar.gz")
sha512sums=('d4b753c50adc04532e5679aa6a3dff3d630be39605ed97a936af9f2f50f4776f7581539caa4c9a2afbddca551051a4c03497b239ae6a4ff3df038a20d4f1b94c')

build() {
  cd "$srcdir/phoebe2-$pkgver"
  python setup.py build
}
package() {
  cd "$srcdir/phoebe2-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
