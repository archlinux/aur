# Maintainer: Dreieck
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=scmxx
pkgver=0.9.0
pkgrel=2
pkgdesc="A tool for exchange data with some Siemens mobile phone"
arch=('i686' "x86_64")
url="http://www.hendrik-sattler.de/scmxx/"
license="GPL"
depends=('glibc' 'perl-image-size')
source=("http://downloads.sourceforge.net/project/scmxx/scmxx/${pkgver}/scmxx-${pkgver}.tar.bz2")
md5sums=('9ed8fe297b39ed1c4d3606e40620835e')

build()  {
  cd $srcdir/$pkgname-$pkgver
  ## --with-device=/dev/XXX: Use /dev/XXX as default. If not specified: Value depends on system.
  ./configure \
    --with-device=/dev/ttyUSB0 \
    --prefix=/usr/
  make || return 1
  make DESTDIR=$pkgdir install
}
