# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
pkgname=kattis-problemtools
pkgver=v1.20190901
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('i686' 'arm' 'x86_64')
url="https://github.com/Kattis/problemtools"
license=('MIT')
depends=('python2' 'gmp' 'java-environment' 'plastex' 'python2-yaml')
builddepends=('python2-setuptools' 'boost')
source=("git+https://github.com/Kattis/problemtools")
fragment=$pkgver
md5sums=('SKIP')

build() {
    cd "$srcdir"/problemtools
    python2 setup.py build
}

package() {
    cd "$srcdir"/problemtools
    python2 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
