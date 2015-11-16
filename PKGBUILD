# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python2-pymongo-2.9
pkgver=2.9
pkgrel=1
pkgdesc="Python driver for MongoDB"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('mongodb: High-performance schema-free document-oriented database')
url="https://github.com/mongodb/mongo-python-driver"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/pymongo/pymongo-$pkgver.tar.gz)
sha256sums=('90e994cfe5928841960dabdca709e75ab4d0f44b288fd59742113982d96290c4')
provides=('python2-pymongo')
conflicts=('python2-pymongo')

build() {
  cd "$srcdir/pymongo-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/pymongo-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --skip-build --optimize=1
}

# vim:set ts=2 sw=2 et:
