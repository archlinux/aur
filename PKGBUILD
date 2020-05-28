# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# WARNING: Unfinished, aguilas has a lot of stuff in the makefile that needs
# fixing (e.g. hard coded Debian paths) before this should be released. The
# upstream development branch has some action so I'm waiting to package that,
# but this 1.x branch should probably never be installed/run.

pkgname=aguilas
pkgver=1.0.2
pkgrel=0
url='https://github.com/LuisAlejandro/aguilas'
pkgdesc='An LDAP user manager and password self-service webaapp'
arch=('any')
license=('GPL3')
#depends=('php' 'php-mcrypt' 'php-gd' 'php-ldap' 'php-suhosin' 'smtp-forwarder' 'mailx')
makedepends=('python-sphinx' 'icoutils' 'python-docutils' 'imagemagick')
# libmagickcore-extra
source=("https://github.com/LuisAlejandro/$pkgname/archive/$pkgver.tar.gz"
        'tempfile.patch'
        'config.php')
sha256sums=('67124886358e6badc2d747dc6b677e119a53fee1f8da56f7cc4fc8a5992a234f'
            '2a0037887545a327b714cc8858f074bffa75b363bfc6ba501b3890009ffee8f3'
            '0b9078a1efb9cef613efac93adf0ad4b9c51c1bd5f4be403f30419b710863974')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "$srcdir"/tempfile.patch
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    find
}
