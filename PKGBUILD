# Maintainer: Sumner Evans <me [at] sumnerevans [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.17.0'
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
    navidrome.service
    navidrome.sysusers
    navidrome.tmpfiles
)
source_x86_64=('https://github.com/deluan/navidrome/releases/download/v0.17.0/navidrome_0.17.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/deluan/navidrome/releases/download/v0.17.0/navidrome_0.17.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/deluan/navidrome/releases/download/v0.17.0/navidrome_0.17.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/deluan/navidrome/releases/download/v0.17.0/navidrome_0.17.0_Linux_arm64.tar.gz')
md5sums=('d41d8cd98f00b204e9800998ecf8427e'
         '3f62e359027ccca9594a136923129802'
         'f3c106c001533c84a64b7238b58bd7ef'
         'b9362d660030646320f16b2c1436a4c2')
md5sums_x86_64=('f59e526877af5f3c285701585afdc101')
md5sums_armv6h=('1897c749eca3aa7a7e09a3256e1fbf97')
md5sums_armv7h=('47d3dc42ca3a786b822cf9224749cc44')
md5sums_aarch64=('8c9b5a1f405a7cdcf6085a02de1f0496')

package() {
  install -Dm755 "$srcdir/navidrome" "$pkgdir/usr/bin/navidrome"

  install -Dm644 "${srcdir}/navidrome.environmentfile" "${pkgdir}/etc/sysconfig/navidrome"
  install -Dm644 "${srcdir}/navidrome.service" "${pkgdir}/usr/lib/systemd/system/navidrome.service"
  install -Dm644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
  install -Dm644 "${srcdir}/navidrome.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/navidrome.conf"
}

