# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=rbfeeder
pkgver=1.0.15+trixie
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
source_aarch64=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_arm64.deb")
sha256sums=(
            '3fb1dae902740e84254a2548c5d81fff18b18658ed408576a438968e43e51746'
            'd8d127259681d44b8d731c80c14658be5fcac44cf5329601dd6d89b1a4d7e82a')
sha256sums_armv6h=('17e65df51c47f4144e480aa1651356cc585c5ace40dede9fb56d7868ba93452f')
sha256sums_armv7h=('17e65df51c47f4144e480aa1651356cc585c5ace40dede9fb56d7868ba93452f')
sha256sums_aarch64=('f4b1b12e82997de9ab28270e0fa6510fe18d25fee1f675a9caea49f2878f8b27')
backup=('etc/rbfeeder.ini')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  install -Dm644 rbfeeder.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 rbfeeder.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
