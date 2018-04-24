# Maintainer: Rolf van Kleef <aur@rolfvankleef.nl>
# Contributor: Nander Voortman
# Contributor: Peter van Dijk
# Contributor: Simon Struck

pkgname="card-mayor"
pkgver=0.0.1
pkgrel=1
pkgdesc="A 2.5d deck-builder city-builder"
url="https://github.com/nanderv/LD41"

arch=(
	'x86_64'
	'386'
)

license=(
	'BSD'
)

depends=(
	'love>=11.0'
)

makedepens=(
	'git'
)

source=(
	"https://github.com/nanderv/LD41/releases/download/v0.0.1/CardMayor.love"
	"$pkgname.desktop"
	"$pkgname"
)

sha256sums=(
	"c5012c70891e54fdff0abb609f7f51f28fc81fb7fe02399564a968d689a4111b"
	"74c3d9d9f6ad643718ff6a5e145d2b29eb60d9332f78781f4082e3dba5809f15"
	"3b43ac4564848a2b23f9fa00c0178e5c5ab8a45215ec62eb1f54c7cec595764f"
)

package() {
	mkdir $pkgdir/opt
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin

	cp -R\
		CardMayor.love\
		$pkgdir/opt/$pkgname.love

	cp\
		$pkgname\
		$pkgdir/usr/bin/$pkgname

	chmod +x $pkgdir/usr/bin/$pkgname

	desktop-file-install\
		$pkgname.desktop\
		--dir $pkgdir/usr/share/applications/
}

