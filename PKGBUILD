# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-go-mono
pkgver=2.2.1
pkgrel=2
pkgdesc="Patched font Go Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-go-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complet')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Go-Mono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('5e00bdf687a0dc97c57e23b607f8d855a681246d7d15d6ba61a7fa7fe881e16540948d3060b2385b80604fc557e949f2899d2ab2dd42176d8adb23c529d97a74'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
