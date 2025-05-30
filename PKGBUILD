# Maintainer: envolution
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Aaron Ali <t0nedef@causal.ca>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=libctl
pkgver=4.5.1
pkgrel=2
arch=('i686' 'x86_64')
url="http://ab-initio.mit.edu/wiki/index.php/Libctl"
#url='https://github.com/NanoComp/libctl/'
depends=(bash)
pkgdesc="Guile-based library implementing flexible control files for scientific simulations"
source=("$pkgname-$pkgver.tar.gz::https://github.com/NanoComp/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('570aa1a17e9ec059668be72c6430c3db366e6ccad0325f0a721fec3aa9e2b4fe')
license=('GPL-2.0-only')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr LIBS="-lm" CFLAGS=" -fPIC"
}
build() {
  cd $pkgname-$pkgver
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
