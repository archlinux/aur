# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.44.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.44.1/navidrome_0.44.1_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.44.1/navidrome_0.44.1_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.44.1/navidrome_0.44.1_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.44.1/navidrome_0.44.1_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
               'navidrome.sysusers'
              )
sha256sums_x86_64=('da59e3e9a34b3de2f0c60c9151014e4090ec39232ef416a77b3f1130c42cef86'
                   'b875b79c99c4dd8e9447463f00896f9d155c3afa8972a2291f8e0771ea1a1280'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4'
                   'bc907165c4e63ac22d757c2d2321a7343cf0bf63d6f3b8790b04b53a4d24a666')
sha256sums_armv6h=('cc5011017d3e9479564a4be3008196333f5a76466ca63e42e99040a065bd973d'
                   'b875b79c99c4dd8e9447463f00896f9d155c3afa8972a2291f8e0771ea1a1280'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4'
                   'bc907165c4e63ac22d757c2d2321a7343cf0bf63d6f3b8790b04b53a4d24a666')
sha256sums_armv7h=('af54bbfaf8f3cc572c7b1b2eb1204a3e76d3cdcf4a7b2bf89d79b2d6844d3085'
                   'b875b79c99c4dd8e9447463f00896f9d155c3afa8972a2291f8e0771ea1a1280'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4'
                   'bc907165c4e63ac22d757c2d2321a7343cf0bf63d6f3b8790b04b53a4d24a666')
sha256sums_aarch64=('4506f60cbb9f2205f7e3ef850570e8b3a2c9346983a6bfdec632b13586970f9c'
                    'b875b79c99c4dd8e9447463f00896f9d155c3afa8972a2291f8e0771ea1a1280'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4'
                    'bc907165c4e63ac22d757c2d2321a7343cf0bf63d6f3b8790b04b53a4d24a666')

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
  install -Dm 644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
}

