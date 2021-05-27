# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.43.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.43.0/navidrome_0.43.0_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.43.0/navidrome_0.43.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.43.0/navidrome_0.43.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.43.0/navidrome_0.43.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
               'navidrome.sysusers'
              )
md5sums_x86_64=('57bb6a2b96be1fc275ef9a4e5906b3b4'
                '7e4600096f11dec326b2340c8c61baab'
                '620404012c5d9982aafc5630f2d37582'
                '12bbcd378a346418cf26e4a4598a84a9')
md5sums_armv6h=('cd2394f9d369e019ce61e7d877c67d05'
                '7e4600096f11dec326b2340c8c61baab'
                '620404012c5d9982aafc5630f2d37582'
                '12bbcd378a346418cf26e4a4598a84a9')
md5sums_armv7h=('45e3bf6ebe894518d59999e94aaea217'
                '7e4600096f11dec326b2340c8c61baab'
                '620404012c5d9982aafc5630f2d37582'
                '12bbcd378a346418cf26e4a4598a84a9')
md5sums_aarch64=('96d75e1eabe501e349fff5976802b13e'
                 '7e4600096f11dec326b2340c8c61baab'
                 '620404012c5d9982aafc5630f2d37582'
                 '12bbcd378a346418cf26e4a4598a84a9')

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
  install -Dm 644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
}

