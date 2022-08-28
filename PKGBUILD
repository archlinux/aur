# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-go-mono
pkgver=2.2.0
pkgrel=1
pkgdesc="Patched font Go Mono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-go-mono')
conflicts=('nerd-fonts-git' 'nerd-fonts-complet')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Go-Mono.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('2a735d400c37d0b07610e077f9a1cb7c15616bec5df8d3e26993c796007227b4fec672e7075769d9c0e3a669cfe0c47b3f7f49b664250da2f6dba47f44daa4df'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
