# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.45.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.45.1/navidrome_0.45.1_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.45.1/navidrome_0.45.1_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.45.1/navidrome_0.45.1_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.45.1/navidrome_0.45.1_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
sha256sums_x86_64=('4d9717ab9d6c2a878b3e6711a6fe1520b0e64ba76c4bb971949cd30c7d2d1163'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv6h=('49b752ef6b7078b0ae12e6b8ef5aa936abc3cba26499aa4ea6aea448aa9053c8'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv7h=('baa86452c8d7a48d67145b22eb4fcfa56042172dc4a9f1d3a2328b7d2076e7d1'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_aarch64=('55ad034a67a68fc86c6b2c283fa58aa3fc7e410cd23701c2a54e155ace65a5b2'
                    'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')

package() {
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
}

