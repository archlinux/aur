# Maintainer: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
pkgver=v2.1.1.r554.g3d0aad6
pkgrel=2
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.com/"
license=('GPL')
depends=('python2'
         'python2-click-5.1'
         'python2-bottle'
         'python2-lockfile'
         'python2-requests'
         'python2-colorama'
         'python2-pyserial')
optdepends=('energia: For MSP430 based projects'
            'arduino: For Arduino based projects')
source=('git+https://github.com/ivankravets/platformio.git')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%%-git}"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
