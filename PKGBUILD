# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.19.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome')
depends=('glibc' 'ffmpeg')
source=(
    navidrome.environmentfile
    https://raw.githubusercontent.com/deluan/navidrome/v0.19.0/contrib/navidrome.service
    navidrome.sysusers
    navidrome.tmpfiles
)
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.19.0/navidrome_0.19.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.19.0/navidrome_0.19.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.19.0/navidrome_0.19.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.19.0/navidrome_0.19.0_Linux_arm64.tar.gz')
md5sums=('d41d8cd98f00b204e9800998ecf8427e'
         '10adbf9f0f1f220d32fc044f76780916'
         'f3c106c001533c84a64b7238b58bd7ef'
         'b9362d660030646320f16b2c1436a4c2')
md5sums_x86_64=('d24b49a3424f06340a0495d8895ac1db')
md5sums_armv6h=('64fe37526afd5450c200436921f758d3')
md5sums_armv7h=('02ec6ad7abb387ae34925488607f4bd2')
md5sums_aarch64=('a592de25fbc4baf9baa2410ac269a43e')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"

  install -Dm644 "${srcdir}/navidrome.environmentfile" "${pkgdir}/etc/sysconfig/navidrome"
  install -Dm644 "${srcdir}/navidrome.service" "${pkgdir}/usr/lib/systemd/system/navidrome.service"
  install -Dm644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
  install -Dm644 "${srcdir}/navidrome.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/navidrome.conf"
}

