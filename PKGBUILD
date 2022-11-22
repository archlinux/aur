# Maintainer: Daniel Flanagan <daniel@lyte.dev>

pkgname=ttf-iosevka-lyte
pkgver=16.4.0
pkgrel=1
pkgdesc="lytedev's customized Iosevka font primarily for the Kitty terminal emulator"
arch=('any')
url="https://github.com/lytedev/Iosevka"
license=('SIL Open Font License v1.1')
source=("https://files.lyte.dev/iosevkalyte/rel/iosevkalyteterm-${pkgver}.tar.zstd"
	"${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://files.lyte.dev/iosevkalyte/rel/iosevkalyteterm-${pkgver}-LICENSE.md")
sha256sums=("655c95c58f7a39c13a7236f94107622fd0166a92ee1a8aa3742ad2aef76f9e8e"
	"46ecadda73abf39cda76731a94fd357b743f882dc1156b4410a2967a811c4ff1")

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -m644 iosevkalyteterm/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
