# Maintainer: Balki  <aur-maintainer-navidrome-systemd at balki dot me>

pkgname=navidrome-systemd
pkgver=1.0
pkgrel=1
pkgdesc="systemd service and config file for navidrome music server"
arch=('any')
depends=('navidrome')
url='https://www.navidrome.org/'
license=('GPL3')
provides=('navidrome-systemd')
backup=('etc/navidrome/navidrome.toml')
source=(navidrome.service
        navidrome.sysusers
        navidrome.toml)

sha512sums=('e82207930a2470066bcc505b2afd4059e6cd64682c69f39681964fcd0efe73b0d8871bec6834ecf782a2d57ab0fc94135a64e1b556471efc6e6b37cf92ace227'
            'fb7f8291b2a9c6f2782b62f1e3455036b5ebfa205106803a09a856e0f2d4d9adcbab25001f607aa84719fa4efec80ad71dcbac9215c2ffdc7f5995134d7d9eb1'
            '4a64f9602a87443204651747fb0c7fce47832d14c8037d8b6c89c25b55a4c784df4865415ed376fa23c4b8baa45c8f09e35554ab25d2d862b605e353973580d1')

# prepare() {
# }
# 
# build() {
# }
# 
# 
# check() {
# }

package() {
  install -Dm 644 "${srcdir}/navidrome.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/navidrome.toml" -t "${pkgdir}/etc/navidrome"
  install -Dm 644 "${srcdir}/navidrome.sysusers" "${pkgdir}/usr/lib/sysusers.d/navidrome.conf"
}
