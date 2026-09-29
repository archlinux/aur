# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>
# Based on fix by eplightning: https://github.com/mudkipme/awesome-minisforum-v3/issues/2#issuecomment-2279282784

pkgname=minisforum-v3-accelerometer
pkgver=1.0.1
pkgrel=1
pkgdesc="Set correct mount matrix for accelerometer using udev hwdb entry"
arch=('x86_64')
url='https://github.com/trijpstra-fourlights/minisforum-v3-accelerometer'
license=('MIT')
depends=('iio-sensor-proxy' 'udev')
optdepends=('minisforum-v3-dsdt: Use patched DSDT to support Minisforum V3 accelerometer')

source=('61-sensor-minisforum-v3.hwdb')
sha256sums=('c883e084683c7a07c8a342a23a0c0d51acfc9941a3832a4d0fe03d90641fd71b')

package() {
    install -Dm644 "$srcdir/61-sensor-minisforum-v3.hwdb" "$pkgdir/usr/lib/udev/hwdb.d/61-sensor-minisforum-v3.hwdb"
}
