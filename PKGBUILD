# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=l5p-keyboard-rgb-bin
pkgver=0.19.0
pkgrel=2
pkgdesc="RGB Keyboard control for Legion 5 (Pro) 2020-2022 and Ideapad Gaming 3 2021"
arch=('x86_64')
url="https://github.com/4JX/L5P-Keyboard-RGB"
license=('gpl')
options=(!emptydirs)
source=(
  "https://github.com/4JX/L5P-Keyboard-RGB/releases/download/v${pkgver}/legion-kb-rgb-linux.zip"
  '99-kblight.rules'
  'legion-kb-rgb.svg'
  'legion-kb-rgb.desktop'
)
sha256sums=(
  '4c1d546da1d187823d0f5456af26bb4d182653ceaf32645f492d6b287df172ff'
  '22946423fd8e0bf7b7fe7e98fc1331f0000064f9fe3c96cd31f52348d3174f16'
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
