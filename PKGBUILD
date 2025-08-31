# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=l5p-keyboard-rgb-bin
pkgver=0.20.7
pkgrel=1
pkgdesc="RGB Keyboard control for Legion 5 (Pro) 2020-2022 and Ideapad Gaming 3 2021"
arch=('x86_64')
url="https://github.com/4JX/L5P-Keyboard-RGB"
license=('gpl')
options=(!emptydirs)
depends=('xdotool')
source=(
  "${pkgver}.zip::https://github.com/4JX/L5P-Keyboard-RGB/releases/download/v${pkgver}/legion-kb-rgb-linux.zip"
  '99-kblight.rules'
  'legion-kb-rgb.svg'
  'legion-kb-rgb.desktop'
)
sha256sums=(
  'd14c227d8eee62dc1a660e2cfd5486e37415df73b6902c8f78c5e42b78ef0c0d'
  '515e70d749183605036ee2b765d0d3caf4b6751c2d20e2918435749b7d6e9ebf'
  'da03140754276cd23d848cf7b9ef517a6a13d642e333db086b00586bcdd884e6'
  '77f41134bac057148ab92c2bfe3ef40f065d6cb6bde52ee38e301fe6b8b5f307'
)
install=${pkgname}.install

package() {
  mkdir -p $pkgdir/etc/udev/rules.d/
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps/
  mkdir -p $pkgdir/usr/share/applications/

  cp $srcdir/99-kblight.rules $pkgdir/etc/udev/rules.d/
  cp $srcdir/legion-kb-rgb $pkgdir/usr/bin/legion-kb-rgb
  cp $srcdir/legion-kb-rgb.svg $pkgdir/usr/share/icons/hicolor/256x256/apps/
  cp $srcdir/legion-kb-rgb.desktop $pkgdir/usr/share/applications/
  chmod +x $pkgdir/usr/bin/legion-kb-rgb
}
