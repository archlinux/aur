# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nerd-fonts-jetbrains-mono
_name=JetBrainsMono
pkgver=2.1.0
pkgrel=3
pkgdesc="A Nerd Font patched version of JetBrains Mono"
arch=('any')
url="https://www.nerdfonts.com"
license=('MIT')
makedepends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
conflicts=('nerd-fonts' 'nerd-fonts-complete')
install="$pkgname.install"
source=("$_name-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/$_name.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=('842013fa44b6896d4eb91635a81ef75244d78d7f61ff866c9dfd3315a67788cd'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
	install -dm755 "$pkgdir/usr/share/fonts/TTF"
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
		-execdir install -m644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
