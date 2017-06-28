# Maintainer: Atnanasi <ys2000pro@gmail.com>
pkgname=angolmois
pkgver=2.0_alpha2
pkgrel=2
pkgdesc="the simple BMS player"
arch=('i686' 'x86_64')
url="https://github.com/lifthrasiir/angolmois"
license=('GPL2')
depends=(sdl2 sdl2_image sdl2_mixer smpeg)
makedepends=(git)
conflicts=(angolmois-git)

source=("https://github.com/lifthrasiir/angolmois/archive/$pkgname-${pkgver//_/-}.tar.gz")
md5sums=("8dee7134cc90a8ef7d6f5109f70308a5")

build() {
	cd "$srcdir/$pkgname-$pkgname-${pkgver//_/-}"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgname-${pkgver//_/-}"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "INTERNALS.md" "$pkgdir/usr/share/doc/$pkgname/INTERNALS.md"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	mkdir -p "$pkgdir/usr/share/angolmois" && chmod 755 "$pkgdir/usr/share/angolmois"
	cp -R "test" "$pkgdir/usr/share/angolmois" && chmod 755 "$pkgdir/usr/share/angolmois/test" && chmod 644 "$pkgdir/usr/share/angolmois/test/"*
}
