# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.42.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
md5sums_x86_64=('e0f4e08cf4a85d0a57c63b7b2869c99c'
                'afcf505fb19e9738d72a7f0097394eb5'
                '2e600d1c9924c8fbb13e23daf246dacb')
md5sums_armv6h=('7ab3413a9ed2efc9337ff0f01159dbe7'
                'afcf505fb19e9738d72a7f0097394eb5'
                '2e600d1c9924c8fbb13e23daf246dacb')
md5sums_armv7h=('2598a08f8605237fafa112783c227024'
                'afcf505fb19e9738d72a7f0097394eb5'
                '2e600d1c9924c8fbb13e23daf246dacb')
md5sums_aarch64=('1c382ea25125c66a97034dee0e7afc8d'
                 'afcf505fb19e9738d72a7f0097394eb5'
                 '2e600d1c9924c8fbb13e23daf246dacb')

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/usr/bin/navidrome"
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/navidrome" "${pkgdir}/usr/bin/navidrome"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
}

