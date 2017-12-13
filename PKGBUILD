# Maintainer: Thorsten Wißmann <edu@thorsten-wissmann.de>
pkgname=kattis-problemtools
pkgver=v1.20170420
pkgrel=1
pkgdesc="Tools to manage problem packages using the Kattis problem package format"
arch=('any')
url="https://github.com/Kattis/problemtools"
license=('MIT')
depends=('python2')
builddepends=('python2-setuptools')
source=("git+https://github.com/Kattis/problemtools")
fragment=v1.20170420
md5sums=('SKIP')

build() {
    cd "$srcdir"/problemtools
    pwd
    make || return 1
    python2 setup.py build || return 1
}

package() {
    cd "$srcdir"/problemtools
    python2 setup.py install --prefix /usr --root="$pkgdir" || return 1
}
