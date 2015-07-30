# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy
pkgname=${_pkg}-${_subpkg}
pkgver=1.0.4
pkgrel=1
pkgdesc='Official MongoDB C++ driver (legacy).'
arch=('i686' 'x86_64')
url='http://www.mongodb.org'
license=(APACHE)
depends=('boost-libs' 'openssl' 'libsasl')
makedepends=('scons' 'boost' 'readline')
source=("https://github.com/mongodb/${_pkg}/archive/${_subpkg}-${pkgver//_/-}.tar.gz")
conflicts=("mongodb<2.6.0")
options=("staticlibs")
provides=("mongo-cxx-driver")

package() {
  cd ${pkgname}-${pkgver//_/-}
  
  scons \
    --use-sasl-client \
    --ssl \
    --prefix="$pkgdir/usr" \
    --disable-warnings-as-errors \
    --sharedclient \
    install
}

sha512sums=('4a8c67f0ed58102bcf70f66ef3e24bd70d2f5f48cb44fd9e498d312ddc04d62d773d01905d7a4fd2cffc3edf90340411939f1dc110876d2a4b77064978e49885')
