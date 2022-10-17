# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.48.0'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'

url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)

provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')

depends=('glibc' 'ffmpeg')

source=('navidrome.service'
        'navidrome.toml'
        )
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.48.0/navidrome_0.48.0_Linux_x86_64.tar.gz')
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.48.0/navidrome_0.48.0_Linux_armv6.tar.gz')
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.48.0/navidrome_0.48.0_Linux_armv7.tar.gz')
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.48.0/navidrome_0.48.0_Linux_arm64.tar.gz')

sha256sums=('c960b24e9aa312617f4a8cefea8be2115c7e3ddb270c3c4e2d0258142496bd02'
            '1a4d88acba7954bf43bb499b8bbb0b32bc0f4ef191866356981e84709f8ba534')
sha256sums_x86_64=('e8d98fb6ce73ac0878ec404b430f2a5b1589515a569072089a4cf6b419bc5f90')
sha256sums_armv6h=('7643938c7e3fcf4a4bde57021e3f5270779e1a28bb5a660d4bdbc21adffaa093')
sha256sums_armv7h=('cf078d3e7064597a128e9d82ae92e3055844bbdd63d264603cd54d53414b9919')
sha256sums_aarch64=('f2bbb57d453ce6b06b84bccf57189a6e3258d943d552dfcf58e32720fb4e90ea')

package() {
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
}

