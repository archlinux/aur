# Maintainer: Lukasz Michalski <lm@zork.pl>

pkgname=python-nagiosplugin
pkgver=1.3.3
pkgrel=1
pkgdesc="a Python class library which helps writing Nagios (or Icinga) compatible plugins easily in Python"
arch=('any')
url="https://github.com/mpounsett/nagiosplugin"
license=('ZPL2.1')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/mpounsett/nagiosplugin.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/nagiosplugin"
    python setup.py build
}

package() {
    cd "$srcdir/nagiosplugin"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
