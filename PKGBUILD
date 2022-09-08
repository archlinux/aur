# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-inconsolata
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font Inconsolata from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-inconsolata')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Inconsolata.zip"
        "$pkgver-LICENSE::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('d8fee284ae3448805f1555e91a68165d60029972fce839fa366b89fcd3b5a51ef5b9263b5455ab809abb5f8daa29c0190f63da125d7328e85a7aea8710bd0997'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 "$pkgver-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
