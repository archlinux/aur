# Maintainer: Raven's Iris <liones121@gmail.com>
pkgname=nerd-fonts-victor-mono
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Victor Mono from nerd-fonts"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=(
  'otf-nerd-fonts'
  'nerd-fonts-victor-mono'
  'ttf-font-nerd'
  'ttf-iosevka-nerd'
  'ttf-nerd-font'
  'ttf-nerd-fonts'
  'ttf-nerd-fonts-symbols'
  'ttf-nerd-fonts-symbols-mono'
)
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-complete-mono-glyphs')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/VictorMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('1225acdbc30e327f0a73235d43a902414f5f27a2'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')


package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
