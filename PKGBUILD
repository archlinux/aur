# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=ucl
pkgver=1.03
pkgrel=9
pkgdesc="Portable lossless data compression library written in ANSI C"
url='https://www.oberhumer.com/opensource/ucl'
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL-2.0-only')
depends=('glibc')
source=("https://www.oberhumer.com/opensource/$pkgname/download/$pkgname-$pkgver.tar.gz")
sha256sums=('b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348')

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -std=gnu90 -fPIC"
  ./configure --prefix=/usr --enable-shared --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
