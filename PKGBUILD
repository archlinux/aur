# Maintainer: Pavan Kumar Sunkara <pavan.sss1991@gmail.com>

pkgname="otf-nerd-fonts-fira-mono"
pkgver=2.3.0
pkgrel=0
pkgdesc="Patched font Fira (Fura) Mono with Nerd Font icons."
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
source=("$pkgname-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('27cf672a21a7c653b1d00debef8fabe0b578180044e80a3fa9bc79ea9bd68432'
            '1f6ad4edae6479aaace3112ede5279a23284ae54b2a34db66357aef5f64df160')

package() {
	find "$srcdir" -iname "Fura*.otf" -not -iname "*Windows Compatible*" \
		-execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

	install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

