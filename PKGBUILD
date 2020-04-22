# Maintainer: Agustin Carrasco <asermax at gmail dot com>
pkgname=nerd-fonts-ubuntu-mono
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font UbuntuMono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-inconsolata')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/UbuntuMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('9b1261cba876307375232b90739a39b0ed639775'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
