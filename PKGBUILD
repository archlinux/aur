# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-terminus
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Terminus (Terminess) from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-terminus')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Terminus.zip"
        "https://github.com/ryanoasis/nerd-fonts/raw/v$pkgver/LICENSE")
b2sums=('1147dab1c27ab578b3aa286069949cc478ebbcc3e7c7d475b3a852eda7c269a0cbf54004f90e88e18d3494c5c4bbb8800374a06e68f9f98699826cb14e60fe18'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
    
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
