# Maintainer: Luca Canavese <l.canavese@protonmail.com>

pkgname=nerd-fonts-agave
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Agave from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
provides=('nerd-fonts-agave')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
source=("Agave-$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Agave.zip"
        "${pkgname}-${pkgver}-LICENSE::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('fe4697c64abecaeb1eca8a23b6901751c58c9685'
          '3175046f10fc45ffaaf96f5e4023d12316db0688')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 ${pkgname}-${pkgver}-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=8 sts=2 sw=2 et:
