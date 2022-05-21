# Maintainer: Gustavo Sousa <gustavo.jo.sousa@gmail.com>
pkgname=nerd-fonts-monofur
pkgver=2.1.0
pkgrel=2
pkgdesc="Patched font Monofur from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Monofur.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
sha1sums=('b46f194a7f6b0db61f1434e7afff508391d9529e'
          '92fdad3c8babc0473da5f03e41fb1151417ab386')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
