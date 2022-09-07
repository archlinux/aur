# Maintainer: Pavan Kumar Sunkara <pavan.sss1991@gmail.com>

pkgname="otf-nerd-fonts-fira-mono"
pkgver=2.2.2
pkgrel=0
pkgdesc="Patched font Fira (Fura) Mono with Nerd Font icons."
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
source=("$pkgname-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('29fff85e0afe0bd723fbd84e6c9587b08fd277cacc516d49bd379faa95612ac3'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
	find "$srcdir" -iname "Fura*.otf" -not -iname "*Windows Compatible*" \
		-execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

	install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

