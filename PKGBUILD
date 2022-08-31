# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-noto
pkgver=2.2.1
pkgrel=2
pkgdesc="Patched font Noto from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-noto')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-noto-sans-mono'
  'nerd-fonts-noto-sans-regular-complete')
groups=("nerd-fonts")
source=("$pkgver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Noto.zip"
        "LICENSE-$pkgver::https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('cff676882d9dbdf6b006c03ffefa0dc878b97d7445fb8923b2b526c12245d7bc47d006f29bd5c4ec72e8318c967e2a2008bc053c77426f74ef669e98e45ab22d'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
