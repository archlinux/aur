# Maintainer: Pavan Kumar Sunkara <pavan.sss1991@gmail.com>

pkgname="otf-nerd-fonts-fira-mono"
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font Fira (Fura) Mono with Nerd Font icons."
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
source=("$pkgname-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=("f4e966bddbbd85826c72b5d6dfcf3c2857095f2e2819784b5babc2a95a544d38"
            "d2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5")

package() {
	find "$srcdir" -iname "Fira*.otf" -not -iname "*Windows Compatible*" \
		-execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

	install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

