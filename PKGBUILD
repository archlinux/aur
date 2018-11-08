# Maintainer: Sri Harsha <toletysriharsha9@gmail.com>
pkgname=nerd-fonts-iosevka
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched Iosevka font from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-iosevka')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Iosevka.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('e575e85ce0e336a67b8daabf7c37e1692f017e31'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

