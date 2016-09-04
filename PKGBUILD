# Maintainer: Will Price <will.price94+aur@gmail.com>
# Contributor: Brice Waegeneire <bricewge at gmail dot com>

pkgname=platformio-git
pkgver=v2.8.6.r596.g0f300a2
pkgrel=3
pkgdesc="A cross-platform code builder and library manager"
arch=('any')
url="http://platformio.com/"
license=('GPL')
depends=('python2'
         'python2-bottle'
         'python2-click-5.1'
         'python2-colorama'
         'python2-lockfile'
         'python2-pyserial'
         'python2-requests'
         'python2-semantic-version')
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
