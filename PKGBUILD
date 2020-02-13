# Maintainer: Guilhelm Savin <aur@gsav.in>
# Maintainer: Jake <aur@ja-ke.tech>
#
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=platformio
pkgver=4.2.0
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="https://github.com/platformio/platformio-core/"
license=('Apache')
depends=('python-setuptools'
         'python-bottle'
         'python-click'
         'python-colorama'
         'python-pyserial>=3.4' #https://github.com/platformio/platformio-core/commit/a37eb9868f3b20e982d0c3cd1a742fcb8ab60efc
         'python-requests'
         'python-semantic-version'
         'python-tabulate'
         'python-pyelftools'
         'python-marshmallow')
conflicts=('platformio-git')
source=("https://github.com/platformio/platformio-core/archive/v${pkgver}.tar.gz")
sha256sums=('ae60d49ab6ac4c07d46196c30119339ae16f0e3c792c51376fdd12faa6204b48')

package() {
    cd "$srcdir/platformio-core-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
