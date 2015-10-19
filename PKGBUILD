# $Id$
# Maintainer: monty <linksoft [at] gmx [dot] de>

_pkg=mongo-cxx-driver
_subpkg=legacy
pkgname=${_pkg}-${_subpkg}
pkgver=1.0.6
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

sha512sums=('caf8cc3df85ae09135592a4423033c136b2e2ecb6d02e688345554a482afbf0fed6ca990e732bb243288ce14735754a6adc46780b06b533d1ca251d081514de3')
