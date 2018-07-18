# Maintainer: pyz3n

pkgname=otf-nerd-fonts-fira-code
pkgver=2.0.0
pkgrel=2
pkgdesc="Monospaced font with programming ligatures. Patched with Nerd Fonts icons."
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
md5sums=('e5bff5da34eb6d16fb20226047c5755c'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')

package() {
        install -d "$pkgdir/usr/share/fonts/OTF"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        find "$srcdir" -not -name "*Windows Compatible*" -a -name "*.otf" \
            -exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF" \;
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
