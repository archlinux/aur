# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
pkgname=kattis-problemtools
pkgver=v1.20170420
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('i686' 'arm' 'x86_64')
url="https://github.com/Kattis/problemtools"
license=('MIT')
depends=('python2' 'gmp' 'java-environment')
builddepends=('python2-setuptools')
source=("git+https://github.com/Kattis/problemtools")
fragment=v1.20170420
md5sums=('SKIP')

build() {
    cd "$srcdir"/problemtools
    python2 setup.py build
}

package() {
    cd "$srcdir"/problemtools
    python2 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
