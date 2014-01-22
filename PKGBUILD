# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>

# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=libpaper
pkgver=1.1.24
pkgrel=6
pkgdesc='Library for handling paper characteristics'
arch=('x86_64' 'i686')
url='http://packages.debian.org/unstable/source/libpaper'
license=('GPL')
depends=('sh')
source=("http://ftp.de.debian.org/debian/pool/main/libp/$pkgname/${pkgname}_$pkgver+nmu2.tar.gz")
sha256sums=('c5bdd6d9dff179699160675dbb61651d9b3158f6da27558fdaba00e7c427ba96')

build() {
  cd "$pkgname-$pkgver+nmu2"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin
  make
}

package() {
  make -C "$pkgname-$pkgver+nmu2" DESTDIR="$pkgdir" install
}
