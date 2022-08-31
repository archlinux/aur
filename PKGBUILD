# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=nerd-fonts-droid-sans-mono
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Droid Sans Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
provides=('nerd-fonts-droid-sans-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/DroidSansMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('ee5706e842250042cc1c60d3c72c2dd26fcf8346'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
