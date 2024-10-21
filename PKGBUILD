# Maintainer: Brandon Waskiewicz <brandon.waskiewicz@gmail.com>

pkgname=ttf-dina-remastered-nerd-font
pkgver=20241020
_nerdfontsversion=v3.2.1
pkgrel=1
pkgdesc='Dina Font TTF Remastered Nerd Fonts'
arch=(any)
url='https://github.com/ryanoasis/nerd-fonts'
license=(custom)
makedepends=(fontforge python ttf-dina-remastered unzip)
source=(https://github.com/ryanoasis/nerd-fonts/releases/download/$_nerdfontsversion/FontPatcher.zip)
sha256sums=('SKIP')

build() {
  cd "${srcdir}"
  ./font-patcher /usr/share/fonts/TTF/DinaRemasterCollection.ttc
  ./font-patcher /usr/share/fonts/TTF/DinaRemasterII.ttc
}

package() {
  install -Dm644 "DinaRemaster Nerd Font.ttc" -t "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 "DinaRemasterII Nerd Font.ttc" -t "$pkgdir"/usr/share/fonts/TTF
}
