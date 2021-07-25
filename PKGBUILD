# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.10.1
pkgrel=2
pkgdesc='A tool for service discovery, monitoring and configuration.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.consul.io"
license=('MPL')
depends=('glibc')
provides=('consul')
source=('consul.service'
        'consul.hcl'
        'consul.sysusers'
        'consul.tmpfiles')
source_i686=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armelv5.zip")
source_armv6h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armhfv6.zip")
source_armv7h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armhfv6.zip")
source_aarch64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm64.zip")

sha256sums=('b2eea8fe453b322bb636afbde3253cb035b2f9d902da7a9abab5dedc7399a639'
            '31782ac6f397dfce957f6f3b2d5c6c4353aa0bc1f46edc403d7ae387b5ecee3a'
            '857d0a0eae217a941045d10877b59d9bc8fbcbba8e7cbe396d160ffd5317fa2c'
            '1838c60658eca84dfef148d179503b9df6c6e6b86ec6706d14d889829c51e532')
sha256sums_i686=('8f4f0806562965bf86017f77d787b7077bc455d5fa3150ec85246f19daaf81dd')
sha256sums_x86_64=('abd9a7696e2eeed66fdb28965c220a2ba45ee5cd79ff263557f5392291aab730')
sha256sums_arm=('f0390897ea643a6692015ecc8a95536eff054538bdb64aeebbc595a2bd391c0c')
sha256sums_armv6h=('25718d3b0d2ab8cea16ccfbd2a3e8162a12e7116c57b58414a8e358a527c3f88')
sha256sums_armv7h=('25718d3b0d2ab8cea16ccfbd2a3e8162a12e7116c57b58414a8e358a527c3f88')
sha256sums_aarch64=('ffdbeffcdb9865e0c84472c5098d5e1654c14d26e94f9e7e4bcefa6679a181a7')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
