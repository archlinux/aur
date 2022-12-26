# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=btdex
pkgver=0.6.7
pkgrel=1
pkgdesc='Decentralized cryptocurrency exchange system running on the Burstcoin blockchain'
arch=('any')
url='https://btdex.trade'
license=('GPL3')
depends=('java-runtime' 'xdg-utils')
source=("https://github.com/btdex/btdex/releases/download/v$pkgver/btdex-v${pkgver}-all.jar"
        "https://raw.githubusercontent.com/btdex/btdex/v$pkgver/src/main/resources/icon.png"
        "https://raw.githubusercontent.com/btdex/btdex/v$pkgver/dist/btdex.desktop"
        "https://raw.githubusercontent.com/btdex/btdex/v$pkgver/LICENSE"
        "btdex.sh")
sha256sums=('658ee3a270c9b1b6333d44a72811fbf75e9dff63eacc241fef29d591ca8676c5'
            '568d8a08b942868ab9aa67458ad9bfcee4d56ef079d2467dd259613bb37d0bff'
            'fa8e5f6561192d1f2554365a7f49c36ac368ae00413f489c0873a801c11e6219'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'e4f8a00dbb222484d4d73ada2dfd5748a56542aeb7ab83abeed5bea4596d411e')
noextract=("btdex-v${pkgver}-all.jar")

package() {
	install -Dm644 btdex-v${pkgver}-all.jar "$pkgdir"/opt/btdex/btdex-all.jar
	install -Dm755 btdex.sh "$pkgdir"/opt/btdex/btdex.sh
	mkdir -p "$pkgdir"/usr/bin
	ln -sf /opt/btdex/btdex.sh "$pkgdir"/usr/bin/btdex

	install -Dm644 btdex.desktop "$pkgdir"/usr/share/applications/btdex.desktop
	install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/btdex.png

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/btdex/LICENSE
}
