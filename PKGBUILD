# Maintainer: Guilhelm Savin <aur@gsav.in>
# Maintainer: Jake <aur@ja-ke.tech>
#
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=platformio
pkgver=4.3.3
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
sha256sums=('883d2d41a0b711c84ef95b844e16abe1ab8cef3888673e4f123ae52eb725e170')

package() {
    cd "$srcdir/platformio-core-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
