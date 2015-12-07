# Maintainer: Dan Johansen <strit83@gmail.com>

pkgname=arena-tracker
pkgver=3.23
pkgrel=1
#epoch=
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('any')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
#groups=()
#depends=()
#makedepends=()
#checkdepends=()
#optdepends=()
provides=(arena-tracker)
conflicts=(arena-tracker)
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("http://www.strits.dk/files/arena-tracker.tar.gz")
#noextract=()
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	mkdir -pm777 $pkgdir/opt/$pkgname/
#	mkdir -p $pkgdir/opt/HSCards/
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	install -dm755 $pkgdir/opt/$pkgname/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/$pkgname $pkgdir/opt/$pkgname/$pkgname
	cp -R $srcdir/HSCards $pkgdir/opt/$pkgname/HSCards
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	ln -s "/opt/$pkgname/HSCards/" "$pkgdir/usr/bin/"
}
md5sums=('db89d6343bcf63425fad6d55f743240d')
