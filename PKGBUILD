# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-noto
pkgver=2.2.2
pkgrel=1
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
b2sums=('9ee384da70b060d22739cb1f9b5834a996a77e2b3fe98efae86683270c260058937a59a191e060ba65fd14e3f21ae5cfac1e28bc434acd44b6e0c11ceb08c7d5'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;

  install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
