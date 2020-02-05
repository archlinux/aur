# Maintainer: dalz <dalz @t disroot d0t org>

pkgname=otf-nerd-fonts-fira-code
pkgver=2.1.0
pkgrel=2
pkgdesc="Monospaced font with programming ligatures. Patched with Nerd Fonts icons."
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig')
conflicts=('nerd-fonts-fira-code' 'nerd-fonts-complete' 'nerd-fonts-git')
source=("$pkgname-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip"
        "$pkgname-LICENSE::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
md5sums=('0b410b02ffb07a36a10459ff44f93438'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')

package() {
        install -d "$pkgdir/usr/share/fonts/OTF"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        find "$srcdir" -not -name "*Windows Compatible*" -a -name "*.otf" \
            -exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF" \;
        install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
