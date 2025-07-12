# Maintainer: Xavier Góngora <ixbalanque at protonmail dot ch>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Jack Random <jack at random dot to>
# Contributor: Samæ <eeva.samæ at marvid dot fr>
# Contributor: Kristaps Karlsons <kristaps.karlsons at gmail dot com>
# Contributor: Max Pray a.k.a. Synthead <synthead at gmail dot com>
# Contributor: berkus <berkus at madfire dot net>
# Contributor: hm_b <holger at music-nerds dot net>

pkgname=renoise-demo
pkgver=3.5.1
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
sha512sums=('f8c8466c03675150f7ea0f34856c10b7320f055ee238b24889b592e377ab4107f9fae83690642aeee9c1271bb5e75d8e669b09f95cb83c4f473ca1265cf07f5a')

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
