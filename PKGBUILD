# Maintainer: Alad Wenter <alad at mailbox dot org>
# Contributor: Dr.Schliemann <doktor.schliemann at gmail dot com>
# Contributor: JHeaton <jheaton at archlinux dot us>

pkgname=basenji
pkgver=1.0.2
pkgrel=1
pkgdesc="Volume indexing tool designed for easy and fast indexing of CD/DVD and other type of volume collections."
arch=('i686' 'x86_64')
url='https://github.com/pulb/basenji'
license=('GPL')
depends=('gtk-sharp-2' 'taglib-sharp' 'gnome-desktop')
makedepends=('gio-sharp')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pulb/basenji/archive/$pkgver.tar.gz")
sha256sums=('3a4f63d0cc3dd78081d8063206f44f933c87f8f17705dca88d17c2b825538cf4')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
