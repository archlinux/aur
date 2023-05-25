# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=l5p-keyboard-rgb-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="RGB Keyboard control for Legion 5 (Pro) 2020-2022 and Ideapad Gaming 3 2021"
arch=('x86_64')
url="https://github.com/4JX/L5P-Keyboard-RGB"
license=('gpl')
options=(!emptydirs)
source=(
  "https://github.com/4JX/L5P-Keyboard-RGB/releases/download/v${pkgver}/legion-kb-rgb-linux.zip"
  '99-kblight.rules'
)
sha256sums=(
  '4ee425d2f8e9959200fe993ad08de1983142d3a267803719a97256ea8a2e766c'
  '22946423fd8e0bf7b7fe7e98fc1331f0000064f9fe3c96cd31f52348d3174f16'
)
install=${pkgname}.install

package() {
  mkdir -p $pkgdir/etc/udev/rules.d/
  mkdir -p $pkgdir/usr/bin/

  cp $srcdir/99-kblight.rules $pkgdir/etc/udev/rules.d/
  cp $srcdir/legion-kb-rgb $pkgdir/usr/bin/legion-kb-rgb
  chmod +x $pkgdir/usr/bin/legion-kb-rgb
}
