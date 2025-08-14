# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
pkgname=vscodium-xdg-dir-patch
pkgver=1.0.0
pkgrel=3
pkgdesc="Patch for VSCodium to store data in ~/.local/share/codium"
arch=(any)
license=('GPL-3.0-only')
depends=(
	codium
)
install=post.install
source=(
    vscodium-xdg-dir-patch.sh
    vscodium-xdg-dir-patch.hook
)
sha256sums=(
	7153a3e0bf835aa3f6c5251b387c6807ce35abe5290b8eac3ffd5cd0e2532d3e
	26090e6baec7fa8ca2d6bb594109590407ce7747e995e06fc85d78714c2ee93c
)

package() {
	install -Dm 644 vscodium-xdg-dir-patch.hook \
		"$pkgdir/usr/share/libalpm/hooks/97-vscodium-xdg-dir-patch.hook"
	install -Dm 755 vscodium-xdg-dir-patch.sh \
		"$pkgdir"/usr/bin/vscodium-xdg-dir-patch
}
