# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
pkgname=qsynergy
pkgver=0.9.1
pkgrel=1
pkgdesc="Qt gui for Synergy which lets you remotely control other computers."
url="http://www.volker-lanz.de/en/software/qsynergy/"
license=(GPL)
arch=('i686' 'x86_64')
depends=('qt' 'synergy')
makedepends=()
conflicts=()
provides=()
source=(http://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('17d8989668016185b859332aacf9e7df')

build() {
   cd $startdir/src/$pkgname-$pkgver
   qmake || return 1
   make || return 1
   install -D -m755 $startdir/src/$pkgname-$pkgver/dist/debian/qsynergy.desktop \
   	$startdir/pkg/usr/share/applications/qsynergy.desktop
   install -D $startdir/src/$pkgname-$pkgver/dist/qsynergy.xpm $startdir/pkg/usr/share/pixmaps/qsynergy.xpm
   install -D -m755 $startdir/src/$pkgname-$pkgver/qsynergy $startdir/pkg/usr/bin/qsynergy
}
