# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=rbfeeder
pkgver=1.0.8+deb11
pkgrel=1
pkgdesc="Software for uploading ADS-B data to RadarBox24.com"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://www.radarbox.com/sharing-data"
license=('GPL2')
depends=('protobuf-c' 'jansson' 'rtl-sdr')
source=(
        'rbfeeder.sysusers'
        'rbfeeder.tmpfiles')
source_armv6h=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_armhf.deb")
source_armv7h=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_armhf.deb")
source_aarch64=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}.1_arm64.deb")
sha256sums=(
            '3fb1dae902740e84254a2548c5d81fff18b18658ed408576a438968e43e51746'
            'd8d127259681d44b8d731c80c14658be5fcac44cf5329601dd6d89b1a4d7e82a')
sha256sums_armv6h=('c3c26a68ab66e04fb92080d64dfef46427ca5a3712b697d2db8d635c8a1a6e1b')
sha256sums_armv7h=('c3c26a68ab66e04fb92080d64dfef46427ca5a3712b697d2db8d635c8a1a6e1b')
sha256sums_aarch64=('d01f7ebc3937a16c378ba6e4ee14176f398f4ed89cc2fbff5388a5fb6dd5ff4e')
backup=('etc/rbfeeder.ini')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -Dm644 ../../rbfeeder.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 ../../rbfeeder.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
