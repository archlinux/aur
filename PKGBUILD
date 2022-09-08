# Maintainer: Agustin Carrasco <asermax at gmail dot com>
pkgname=nerd-fonts-ubuntu-mono
pkgver=2.2.2
pkgrel=1
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
sha1sums=('bbab8594f86f83599a0bc688e3b57b3d1caf972d'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
