# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.46.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.46.0/navidrome_0.46.0_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.46.0/navidrome_0.46.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.46.0/navidrome_0.46.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.46.0/navidrome_0.46.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
              )
sha256sums_x86_64=('6da0524199e5702e73abbc0a59b89af3110ca99b828249ffcf2416c2d7c79ffc'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv6h=('653d07d94d6add4dcce09204578167ff9a94c828298f43fc9a16943cf819f14f'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_armv7h=('8cb14112f49f32fde66e8d7da8651d6b7f1304106707428902a20292f8b529de'
                   'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                   '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')
sha256sums_aarch64=('2a6e7c04c7369e0bfa08ba9790da432310be9c56ff7dbbf3ee2045d3fc4d72c5'
                    'c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
                    '5ac4183b961438c8f838d82d8772b856d97ea7aeed2ab4ac4d5fc69559da43d4')

package() {
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
}

