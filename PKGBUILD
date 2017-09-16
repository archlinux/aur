# Maintainer: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
_pkgname=platformio-core
pkgver=v3.3.0.r296.gaa1c7609
pkgrel=1
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.org/"
license=('GPL')
depends=('python2'
         'python2-arrow'
         'python2-bottle'
         'python2-click-5.1'
         'python2-colorama'
         'python2-lockfile'
         'python2-pyserial'
         'python2-requests'
         'python2-semantic-version')
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
source=('git+https://github.com/platformio/platformio-core.git')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_pkgname}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
