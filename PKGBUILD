# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-fira-code
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Fira (Fura) Code from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-fira-code')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'otf-nerd-fonts-fira-code')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/FiraCode.zip")
b2sums=('9f8ada87945ff10d9eced99369f7c6d469f9eaf2192490623a93b2397fe5b6ee3f0df6923b59eb87e92789840a205adf53c6278e526dbeeb25d0a6d307a07b18')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
