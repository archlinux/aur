# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-objection
pkgver=1.7.5
pkgrel=1
pkgdesc="runtime mobile exploration"
arch=('any')
url=https://github.com/sensepost/objection
license=('GPLv3')
depends=(python python-flask python-click python-frida python-frida-tools python-tabulate python-prompt_toolkit)
makedepends=('python-setuptools')
source=(https://github.com/sensepost/objection/archive/${pkgver}.tar.gz)
sha256sums=('f3caee908f98e3ed2fe5c4e1555c2a85e371aadde8d273b033f5bcbd52617419')

prepare() {
  cd "$srcdir/objection-$pkgver/"
  #versioneer install 
}

build() {
  cd "$srcdir/objection-$pkgver/"
  python setup.py build
}


package() {
  cd "$srcdir/objection-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
