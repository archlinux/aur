# Contributor: dalz <dalz @t disroot d0t org>
# Maintainer: Juan Simón <play4pro at protonmail dot com>

pkgname=otf-nerd-fonts-fira-code
pkgver=2.2.2
pkgrel=1
pkgdesc="Monospaced font with programming ligatures. Patched with Nerd Fonts icons."
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('MIT')
depends=('fontconfig')
conflicts=('nerd-fonts-fira-code' 'nerd-fonts-complete' 'nerd-fonts-git')
source=("$pkgname-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip"
        "$pkgname-LICENSE::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
md5sums=('0770253a43dc050aa0fc3b090adfb800'
         '935bbbdc8410b3b32315cc20da9d2126')

package() {
        install -d "$pkgdir/usr/share/fonts/OTF"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        find "$srcdir" -not -name "*Windows Compatible*" -a -name "*.otf" \
            -exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF" \;
        install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
