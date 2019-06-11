# Maintainer: Alexandre `Zopieux` Macabies <web+aur@zopieux.com>

pkgname=pam-wrapper
pkgname_=pam_wrapper
pkgver=1.0.7
pkgrel=1
pkgdesc='A tool to test PAM applications and PAM modules.'
arch=('any')
url='https://cwrap.org/pam_wrapper.html'
license=('GPL3')
depends=('pam')
optdepends=('python' 'python2')
source=("git://git.samba.org/pam_wrapper.git#tag=${pkgname_}-${pkgver}")
md5sums=('SKIP')

prepare() {
    mkdir "$srcdir/${pkgname_}/build"
    cd "$srcdir/${pkgname_}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

build() {
    cd "$srcdir/${pkgname_}/build"
    make
}

package() {
    cd "$srcdir/${pkgname_}/build"
    make DESTDIR="$pkgdir/" install
}

# vim: et:ts=4:sw=4
