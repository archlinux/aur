# Maintainer: Xavier Góngora <ixbalanque at protonmail dot ch>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Jack Random <jack at random dot to>
# Contributor: Samæ <eeva.samæ at marvid dot fr>
# Contributor: Kristaps Karlsons <kristaps.karlsons at gmail dot com>
# Contributor: Max Pray a.k.a. Synthead <synthead at gmail dot com>
# Contributor: berkus <berkus at madfire dot net>
# Contributor: hm_b <holger at music-nerds dot net>

pkgname=renoise-demo
pkgver=3.5.2
pkgrel=1
pkgdesc="A music composition program"
arch=("x86_64")
url="https://www.renoise.com"
license=("custom:renoise")
depends=("alsa-lib" "gcc-libs" "hicolor-icon-theme" "libxext")
optdepends=("jack: For JACK audio support")
conflicts=("renoise")
options=("!strip")
source=("https://files.renoise.com/demo/Renoise_${pkgver//./_}_Demo_Linux_x86_64.tar.gz")
sha512sums=('e64c9b1e5b5fab4a2cae81ca8477c2a27b372b643d10eb09522851e23662fbcddf9c83103e5ee4d9d84cc642e2f0be076765c711f3df093d29060176c0344e2f')

package() {
  cd "Renoise_${pkgver//./_}_Demo_Linux_x86_64"

  mkdir -p "$pkgdir/usr/share/renoise-$pkgver"
  cp -r "Resources"/* "$pkgdir/usr/share/renoise-$pkgver"

  install -Dm 755 "renoise" "$pkgdir/usr/bin/renoise"
  install -Dm 644 "Installer/renoise.desktop" "$pkgdir/usr/share/applications/renoise.desktop"
  install -Dm 644 "Installer/renoise.1.gz" "$pkgdir/usr/share/man/man1/renoise.1.gz"
  install -Dm 644 "Installer/renoise-pattern-effects.5.gz" "$pkgdir/usr/share/man/man5/renoise-pattern-effects.5.gz"
  install -Dm 644 "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "Installer/renoise.xml" "$pkgdir/usr/share/mime/packages/renoise.xml"
  install -Dm 644 "Installer/renoise-48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/renoise.png"
  install -Dm 644 "Installer/renoise-64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/renoise.png"
  install -Dm 644 "Installer/renoise-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/renoise.png"
}
