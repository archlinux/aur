# Packager: Solot Paul <solotpaul at protonmail dot com>
# Maintainer: Solot Paul <solotpaul at protonmail dot com>

pkgname=nerd-fonts-overpass
pkgrel=1
pkgver=2.1.0
pkgdesc="All variants of Nerd-Font patched Overpass"
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
provides=("${pkgname}")
groups=("nerd-fonts")
conflicts=('nerd-fonts-complete' 'nerd-fonts-git')
source=(
	"https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Overpass.zip"
	"https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE"
)
sha1sums=(
	'6229a1a6eca9c2ecd7a0e363dac379b79ac6ecc1'
	'92fdad3c8babc0473da5f03e41fb1151417ab386'
)

package() {
	find . -iname "*.otf" -not -iname "*Windows*" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
