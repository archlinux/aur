# Maintainer: Guilhelm Savin <aur@gsav.in>
# Maintainer: Jake <aur@ja-ke.tech>
#
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=platformio
pkgver=3.6.7
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="https://github.com/platformio/platformio-core/"
license=('Apache')
depends=('python2'
	 'python2-arrow'
         'python2-bottle'
         'python2-click-5.1' # https://github.com/platformio/platformio/issues/349
         'python2-colorama'
         'python2-lockfile'
         'python2-pyserial>=3.4' 
# https://github.com/platformio/platformio-core/commit/a37eb9868f3b20e982d0c3cd1a742fcb8ab60efc
         'python2-requests'
         'python2-semantic-version'
         'python2-setuptools')
conflicts=('platformio-git')
source=("https://github.com/platformio/platformio-core/archive/v${pkgver}.tar.gz")
sha256sums=('0486cf72c02ade8ce26643c33784f8f801860c7c5149f5a511a6dedcee341869')

package() {
    cd "$srcdir/platformio-core-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
