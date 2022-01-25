# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.47.5'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.47.5/navidrome_0.47.5_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.47.5/navidrome_0.47.5_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.47.5/navidrome_0.47.5_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.47.5/navidrome_0.47.5_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
sha256sums_x86_64=('0244a3b659f9dc70dd21c4209c0f168f4d744579ce94eb059b6c1f5606efc2d7'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv6h=('4d02b828505826f91cf410856b2baa47fb2fe8f4ce3fb2b291dbd432c28c10db'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv7h=('81663cd2e7a571e9db798f45161bdde8c681fa60e0e30e454dcee403010d0632'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_aarch64=('f95051895db329ae8fc1a9968ff8e61388aea288400faa1e1a79458b8ff4d473'
                    'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')

package() {
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
}

