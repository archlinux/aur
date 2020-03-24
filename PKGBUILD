# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/ezusb. Original contribution block:
# Maintainer: Young Acinonyx <young.acinonyx [at ] gmail [dot] com>

pkgname=ezpad
pkgver=1.5.3
pkgrel=1
epoch=
pkgdesc="Driver for EZpad smart card readers"
arch=('x86_64')
url="https://www.castlestech.com/"
license=('unknown')
depends=('lib32-pcsclite')
source=("$pkgname-$pkgver.zip"::"https://www.castlestech.com/wp-content/uploads/2016/08/201251014271670555.zip")
sha256sums=('82465c20d5aa7ea7e91c7fb32df4d7832a76dda506d2735fb2df5bde7360c2b2')

package() {
  mkdir -p "$pkgdir/usr/lib32/pcsc/drivers/$pkgname.bundle/Contents/Linux"
  cp -Rfv "$srcdir/EZpad_Linux_x86_v${pkgver}/driver_${pkgname}_v${pkgver}/drivers/Info.plist" "$pkgdir/usr/lib32/pcsc/drivers/${pkgname}.bundle/Contents/"
  cp -Rfv "$srcdir/EZpad_Linux_x86_v${pkgver}/driver_${pkgname}_v${pkgver}/drivers/${pkgname}.so" "$pkgdir/usr/lib32/pcsc/drivers/${pkgname}.bundle/Contents/Linux"
}
