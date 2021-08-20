# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.45.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.45.0/navidrome_0.45.0_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.45.0/navidrome_0.45.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.45.0/navidrome_0.45.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.45.0/navidrome_0.45.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
sha256sums_x86_64=('a5028580afe74b882ac611fa08be93c215320bf7939acfadfd0aac5e834346c7'
                   '5b7a98ffbef452eda01688d2d59a6113eba92296cfd379ca44a39c7fac51a9b2'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv6h=('3a6ac2a1c9bd984691490c948941c2187620322b89da68d5c8016a67d82df567'
                   '5b7a98ffbef452eda01688d2d59a6113eba92296cfd379ca44a39c7fac51a9b2'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv7h=('a5d59d262ec727398f304d0b36128abe6d4b6aec47f89aa4b42c57567972533d'
                   '5b7a98ffbef452eda01688d2d59a6113eba92296cfd379ca44a39c7fac51a9b2'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_aarch64=('768cc98a2f24e51c3868e2408f0f2897713fd10b8a22f37b911a849302c3feaf'
                    '5b7a98ffbef452eda01688d2d59a6113eba92296cfd379ca44a39c7fac51a9b2'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
}

