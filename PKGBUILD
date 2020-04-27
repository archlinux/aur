# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.16.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source=(
    navidrome.service
    navidrome.sysusers
    navidrome.tmpfiles
)
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.16.1/navidrome_0.16.1_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.16.1/navidrome_0.16.1_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.16.1/navidrome_0.16.1_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.16.1/navidrome_0.16.1_Linux_arm64.tar.gz')
md5sums=('10adbf9f0f1f220d32fc044f76780916'
         'f3c106c001533c84a64b7238b58bd7ef'
         'b9362d660030646320f16b2c1436a4c2')
md5sums_x86_64=('083cc5ea51861e6347a98f75a6c7dd19')
md5sums_armv6h=('cf39c923a98955820cc3c6b874c7edd7')
md5sums_armv7h=('b84d06e86acf7bb1ce52539e9388ab00')
md5sums_aarch64=('f012a93cd229e369962c9a0d85ab9686')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"

  install -Dm644 "${srcdir}/navidrome.service" "${pkgdir}/usr/lib/systemd/system/navidrome.service"
  install -Dm644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
  install -Dm644 "${srcdir}/navidrome.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/navidrome.conf"
}

