# Maintainer: Topi Kainulainen <topikainulainen@protonmail.com>

pkgname=ttf-nerd-fonts-fira-code
pkgver=2.2.2
pkgrel=1
pkgdesc="Monospaced font with programming ligatures. Patched with Nerd Fonts icons."
arch=('any')
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
conflicts=('nerd-fonts-fira-code' 'nerd-fonts-complete' 'nerd-fonts-git')
source=("$pkgname-$pkgver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip"
        "$pkgname-LICENSE::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha256sums=('20182e6e7c42cf8ab479d83af3200266261ec9bd4e80cdaceb793ecd56c9a398'
            '245b522abb5aba0d8e84898bf6d5e95102620637626106bfd0061189a2370360')
package() {
        install -d "$pkgdir/usr/share/fonts/TTF"
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        find "$srcdir" -not -name "*Windows Compatible*" -a -name "*.ttf" \
            -exec install -Dm644 {} "$pkgdir/usr/share/fonts/TTF" \;
        install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

