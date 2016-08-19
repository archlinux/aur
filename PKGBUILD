# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgbase=php-xapian
pkgname=('php-xapian')
_realname=xapian-bindings
pkgver=1.2.23
epoch=1
pkgrel=1
pkgdesc="PHP bindings for Xapian"
arch=('armv7h' 'i686' 'x86_64')
url="http://xapian.org/docs/bindings/php/"
depends=('php' "xapian-core=$epoch:$pkgver")
license=('GPL')
source=("http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-${pkgver}.tar.xz")
sha512sums=('4be9d103a4073a08d2481e9ddc347156d4028a1517f313861ad3664e6103e052dc1a0d07a992da3ca02599505c002d09d77c4fd886c144918aab72977e69994c')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
    --prefix=/usr --with-php
  make
}

package() {
  cd ${_realname}-$pkgver
  make DESTDIR="$pkgdir" install
}