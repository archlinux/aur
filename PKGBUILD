# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.47.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.47.0/navidrome_0.47.0_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.47.0/navidrome_0.47.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.47.0/navidrome_0.47.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.47.0/navidrome_0.47.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
sha256sums_x86_64=('32806fd9d4c2a2d2e719a64e5162d2718775fa02928cf5d34a41c047a522adc0'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv6h=('9cf4f771a5ad39e31f4b01fe8a276183b754a9d390af16fd5bed48aac7690744'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv7h=('8100c0a02ec6bd9941c3d44433c9fa5e11b49e86a8d5b9fc36f62225a8d0af6f'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_aarch64=('1488ebc3e0412573a387502855d7cf64875c0f2939c92ff3283d4efaedf56251'
                    'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')

package() {
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
}

