# Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=nerd-fonts-fantasque-sans-mono
pkgver=2.0.0
pkgrel=1
pkgdesc="Patched font FantasqueSansMono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-fantasque-sans-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("${url}/releases/download/v$pkgver/FantasqueSansMono.zip"
        "${url}/raw/v$pkgver/LICENSE")
sha1sums=('9c7331eab8f1cb09cb9546bad0b1fa3280e50662'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
        -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

