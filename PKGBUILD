# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nerd-fonts-ibm-plex-mono
_name=IBMPlexMono
pkgver=2.1.0
pkgrel=3
pkgdesc="A Nerd Font patched version of IBM Plex™ Mono"
arch=('any')
url="https://www.nerdfonts.com"
license=('MIT')
makedepends=('fontconfig' 'xorg-mkfontscale' 'xorg-mkfontdir')
conflicts=('nerd-fonts' 'nerd-fonts-complete')
install="$pkgname.install"
source=("$_name-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/$_name.zip"
        "https://raw.githubusercontent.com/ryanoasis/nerd-fonts/$pkgver/LICENSE")
sha256sums=('4fd7d9fd21cfcb7808548617628e3f2044e9eaa5871261767472e739ed9d6e76'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
	install -d "$pkgdir/usr/share/fonts/TTF"
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
		-execdir install -m644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
