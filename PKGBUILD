# Maintainer: Pavan Kumar Sunkara <pavan.sss1991@gmail.com>

pkgname="otf-nerd-fonts-fira-mono"
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Fira (Fura) Mono with Nerd Font icons."
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
source=("$pkgname-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('e60a9f8cd097c2cbaa54dc08dc861d6d02809cfc0d35d60410648cefb1855c23'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
	find "$srcdir" -iname "Fura*.otf" -not -iname "*Windows Compatible*" \
		-execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

	install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

