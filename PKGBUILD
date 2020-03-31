# Maintainer: Rónán Carrigan <ronan.carrigan at gmail dot com>
# Adapted from PKGBUILD for nerd-fonts-fira-code (https://aur.archlinux.org/packages/nerd-fonts-fira-code/)

pkgname=nerd-fonts-monoid
pkgver=2.1.0
pkgrel=1
pkgdesc="Patched font Monoid from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-monoid')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Monoid.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
md5sums=('ebcefb7d20e746d58dd6448e6f984326'
         '1b95f7668f3a4440b0d404e8dc3ccd9c')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

