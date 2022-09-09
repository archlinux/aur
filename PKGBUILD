# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
pkgname=nerd-fonts-droid-sans-mono
pkgver=2.2.2
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
sha1sums=('9b2d423f75ea1cd9568117551e87146239cd8602'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
