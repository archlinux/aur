# Maintainer: Sitansh Rajput <me [at] lostpolaris [dot] com>

pkgbase='navidrome-bin'
pkgname=(navidrome-bin)
pkgver='0.42.1'
pkgrel=1
pkgdesc='Music Server and Streamer compatible with Subsonic/Airsonic'
url='https://www.navidrome.org/'
license=('GPL3')
arch=(x86_64 armv6h armv7h aarch64)
provides=('navidrome')
conflicts=('navidrome' 'navidrome-systemd')
backup=('var/lib/navidrome/navidrome.toml')
depends=('glibc' 'ffmpeg')
source_x86_64=('https://github.com/navidrome/navidrome/releases/download/v0.42.1/navidrome_0.42.1_Linux_x86_64.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv6h=('https://github.com/navidrome/navidrome/releases/download/v0.42.1/navidrome_0.42.1_Linux_armv6.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_armv7h=('https://github.com/navidrome/navidrome/releases/download/v0.42.1/navidrome_0.42.1_Linux_armv7.tar.gz'
               'navidrome.service'
               'navidrome.toml'
               'navidrome.sysusers'
              )
source_aarch64=('https://github.com/navidrome/navidrome/releases/download/v0.42.1/navidrome_0.42.1_Linux_arm64.tar.gz'
                'navidrome.service'
                'navidrome.toml'
               'navidrome.sysusers'
              )
sha512sums_x86_64=('ca3ec3fdc3e2ea019def5524a0d2f6b5140d1ca7000a121e9792685ded2f39596e51c4d5ab2f919392d701907db5bdcd006c12341c7f23542a04b18328f951ac'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_armv6h=('5811fe981f411c6e7db14d552a085c336c9a1fa0ddbcd31171309c8f5a07625b6f5826f796e1bcd7f5c739220b30d3139d9f9931480bc0934b478db3f4962505'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_armv7h=('b7b585881017a950f83ffc58a9ae49803c95635662d967ea9cd2a0373e88c76b52a4c5592a4eed9810163b768fda95bc12340b815e133beca6978eda95cfbbe5'
                   '6d1fa18a3a6894a9aa719cf8d1de750bf5bc8e981e7397d96030010c9f5e3222c0b9332601498fab659afa2b5fbbd7adf6b75a2f64c6b599470d99039e3ef3e2'
                   'd0f1040a4d93de5cc5c008df16e140939285a7c27119382ec41974f5207dc2265b613ca804ca3e841d1171dce2ad9bc6c321777aea3ae47d88e0672473253463'
                   'f04f474a8f2bf664e1e2a809df341cacbc99f47adec32c35bf406b2e432e16362599147365bc5d614ba3c74e6b7e1395027a511318df25be7d84f5cb40c0b047')
sha512sums_aarch64=('ccf82e693042ca4126011b8465332275bb349e19cca9e1a994a80d3f5633788a59feced9be328f961285fc58a15213c0f296095171b83abf35213298b5fea5ab'
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

