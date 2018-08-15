# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=nerd-fonts-droid-sans-mono
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched font Droid Sans Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-droid-sans-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/DroidSansMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('e5235aa39d2beae38c22d8e2381475f18b97b445'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
