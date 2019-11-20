# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=nerd-fonts-roboto-mono
pkgver=2.0.0
pkgrel=2
pkgdesc="Patched font Roboto Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-roboto-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/RobotoMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('bf637b3e62aa00c81f06333544b7c8ab11cc206f'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
