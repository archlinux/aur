# Maintainer: MartiMcFly <martimcfly [at] autorisation.de>

pkgbase=php-xapian
pkgname=('php-xapian')
_realname=xapian-bindings
pkgver=1.4.14
epoch=1
pkgrel=1
pkgdesc="PHP bindings for Xapian"
arch=('armv7h' 'i686' 'x86_64')
url="http://xapian.org/docs/bindings/php/"
depends=('php' "xapian-core=$epoch:$pkgver")
license=('GPL')
source=("http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-${pkgver}.tar.xz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
    --prefix=/usr --with-php7
  make
}

package() {
  cd ${_realname}-$pkgver
  make DESTDIR="$pkgdir" install
}
