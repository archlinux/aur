# Maintainer: Vicki Pfau (vi@endrift.com)

pkgname=steamos-powerbuttond
_srctag=v4.2
pkgver=${_srctag##v}
pkgrel=1
arch=('x86_64')
url="https://github.com/evlav/powerbuttond"
pkgdesc="Power button daemon for SteamOS"
license=('BSD')
depends=('libevdev' 'udev' 'gamescope')
source=("steamos-powerbuttond::git+https://github.com/evlav/powerbuttond.git#tag=$_srctag")
replaces=('powerbuttond')
conflicts=('powerbuttond')
provides=('powerbuttond')
sha512sums=('95bd9ce60bfa8525558af47733cc9d4496477f3fe543629728dc1264a0da29b1577cc84dbd3182ddef436b20994d5a814ef80e05694fb96f9b94e7bd970471a7')

build() {
	make -C "$srcdir/$pkgname"
}

package() {
	make -C "$srcdir/$pkgname" install DESTDIR="$pkgdir"
}
