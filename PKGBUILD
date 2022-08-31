# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-fira-code
pkgver=2.2.1
pkgrel=3
pkgdesc="Patched font Fira (Fura) Code from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-fira-code')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'otf-nerd-fonts-fira-code')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip")
b2sums=('344aab77dc8b63cf3662c473745a35ef929d1af09fe8de31419ab0b848987542052546a5d5eda1b822d89cd0c0ab0bd8979099b84956370deb84894542317225')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
