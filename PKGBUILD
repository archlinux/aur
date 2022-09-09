# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=nerd-fonts-roboto-mono
pkgver=2.2.2
pkgrel=2
pkgdesc="Patched font Roboto Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
provides=('nerd-fonts-roboto-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("RobotoMono-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/RobotoMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('cbd356d71a980b328e67c890414f0bf0f5239514'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
