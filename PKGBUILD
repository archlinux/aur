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
               'navidrome.sysusers'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.42.0/navidrome_0.42.0_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
               'navidrome.sysusers'
              )
sha512sums_x86_64=('372467ee1ce87adc301667486f497a4598824d2431d9515e3418571e3bffc90c9eb33c20e22f7c2ecf0fc7ae0948a798777f1c19dae3ea66b03a29024516fb80'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_armv6h=('b0655f0ac5db347e8d672c8ecef72e1ad77d63bca35ee0db41a9b962dd4f85f43c932ea2c7b25ca5da54765cfddac574cd46fb3acb06d435f2d3d8e53b460df8'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_armv7h=('1b38c2289bb19ff1ce42961c32d345a0b4f61b1fdef1fd2f758a78865a04ddc38de8d4a1c3d689d8fcfcfb856660f02279f930179446cede31d1c29a87eb2971'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_aarch64=('7f9cc6352c9ff94fbc68611f4337f0d3c56d0bc6d2a0612198cb4438969dbbadd2499045b495b62acddb73599e43628c099fbde03db9474d68f10e6626af2ba1'
                    '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                    'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                    'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')

package() {
  install -d -o navidrome -g navidrome "${pkgdir}/var/lib/navidrome"
  install -Dm 755 "${srcdir}/navidrome" -t "${pkgdir}/usr/bin/"
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/var/lib/navidrome"
  install -Dm 644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
}

