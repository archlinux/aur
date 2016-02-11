#
# Maintainer: Guilhelm Savin <aur@gsav.in>
# Upstream URL: https://github.com/platformio/platformio
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/gsavin/arch
#

pkgname=platformio
pkgver=2.8.3
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="https://github.com/platformio/platformio/"
license=('GPL')
depends=('python2'
         'python2-click'
         'python2-bottle'
         'python2-lockfile'
         'python2-requests'
         'python2-colorama'
         'python2-pyserial')
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
conflicts=('platformio-git')
source=("https://github.com/platformio/platformio/archive/v${pkgver}.tar.gz")
sha256sums=('b37cccd70281b9c1d597fc3c05c7a3524ccf8a83668a1172e4790d3b025961db')

prepare() {
	cd "platformio-$pkgver"
	patch setup.py ${startdir}/setup.patch
}

package() {
    cd "$srcdir/platformio-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
