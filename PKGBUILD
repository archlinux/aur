# Packager: Joseph R. Quinn <quinn.josephr@protonmail.com>
# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=nerd-fonts-inconsolata
pkgver=2.2.1
pkgrel=2
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
b2sums=('f5d7a37c2d50f76be84dde68b67336ae1fe6a125e15997b62fa4bdbfab730561d7568bee3ef0e3387c0fdb3621f924865e78401c6e5d8eff7b6965cfe8e8aac0'
        '386dfcb5ead367bfc44fc55f7e94548c03bdb24ca088ab56f9609e7cdaa3eab9c56b548966feaf7312da606b645e9af35556fc212132733efcdbcc17397c808a')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;

  install -Dm644 "$pkgver-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
