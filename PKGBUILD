# Maintainer: Pavan Kumar Sunkara <pavan.sss1991@gmail.com>

pkgname="otf-nerd-fonts-fira-mono"
pkgver=2.2.0
pkgrel=0
pkgdesc="Patched font Fira (Fura) Mono with Nerd Font icons."
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=("MIT")
depends=("fontconfig")
conflicts=("nerd-fonts-complete" "nerd-fonts-git")
source=("$pkgname-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/ryanoasis/nerd-fonts/v$pkgver/LICENSE")
sha256sums=('5fd014fa154e8defb1031bb696033c3d64e1e5dace59baa8efed497eecf8f80c'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')

package() {
	find "$srcdir" -iname "Fira*.otf" -not -iname "*Windows Compatible*" \
		-execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

	install -Dm644 "$srcdir/$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

