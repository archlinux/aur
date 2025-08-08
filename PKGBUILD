# Maintainer: Damglador <vse.stopchanskyi@gmail.com>
pkgname=vscodium-xdg-dir-patch
pkgver=1.0.0
pkgrel=2
pkgdesc="Patch for VSCodium to store data in ~/.local/share/codium"
arch=(any)
license=('GPLv3')
depends=(
	codium
)
install=post.install
source=(
    vscodium-xdg-dir-patch.sh
    vscodium-xdg-dir-patch.hook
)
sha256sums=(
	1535a58d657efca23b66891ecc2885786f2db3bf63451fb461c16b42c7bba559
	26090e6baec7fa8ca2d6bb594109590407ce7747e995e06fc85d78714c2ee93c
)

package() {
	install -Dm 644 vscodium-xdg-dir-patch.hook \
		"$pkgdir/usr/share/libalpm/hooks/97-vscodium-xdg-dir-patch.hook"
	install -Dm 755 vscodium-xdg-dir-patch.sh \
		"$pkgdir"/usr/bin/vscodium-xdg-dir-patch
}
