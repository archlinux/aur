# Maintainer: Gustavo Sousa <gustavo.jo.sousa@gmail.com>
pkgname=nerd-fonts-monofur
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Monofur from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('custom:Monofur Free License')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Monofur.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/patched-fonts/Monofur/Regular/complete/LICENSE.txt")
sha1sums=('4494118d40aa755a511278cab3d1394694d72c6d'
          '906c804f4ccc1e4cc70008e272ffa36003c868af')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
