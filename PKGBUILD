# Maintainer: duffy dack @t gee mail d0t com

pkgname=nerd-fonts-fira-mono
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Fira Mono from nerd-fonts library"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
source=(
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraMono.zip"
    "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha256sums=('f4e966bddbbd85826c72b5d6dfcf3c2857095f2e2819784b5babc2a95a544d38'
            'd2a29823384e9194a87936ccad495c764c2ef733b29bfa6f72a1d65803ce02e5')

package() {
    install -d "$pkgdir/usr/share/fonts/OTF"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    find "$srcdir" -not -name "*Windows Compatible*" -a -name "*.otf" \
	-exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF" \;
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
