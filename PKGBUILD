# Maintainer: Lyr <lyr7d1h@pm.me>
pkgname=nerd-fonts-ubuntu
pkgver=2.2.2
pkgrel=0
pkgdesc="Patched font Ubuntu and UbuntuMono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-inconsolata')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-ubuntu-mono')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/UbuntuMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Ubuntu.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('bbab8594f86f83599a0bc688e3b57b3d1caf972d'
          '26bdc59df81d8552cadb1c3481126586a4fb801c'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
