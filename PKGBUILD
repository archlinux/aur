# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-liberation-mono
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Liberation Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=("${pkgname}")
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/LiberationMono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('0c499816e866cd94dec3b8bdf1c1c83c5bedcf38677597d05980a17d1690acf834532980b17fdfb3e5b3a2a9167815cd638d3cf1be0d09a23db8f8a7430042c6'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
