# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=lv2proc
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple command line effect processor using LV2 plugins."
arch=('i686' 'x86_64')
url="http://naspro.sourceforge.net/"
license=('GPL3')
depends=('libsndfile' 'lilv')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('ab05eca009dcf96ca093555b6536e65b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
