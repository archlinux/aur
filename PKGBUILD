# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.11.0
pkgrel=1
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
source_arm=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_armv6h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_armv7h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm64.zip")

sha256sums=('b2eea8fe453b322bb636afbde3253cb035b2f9d902da7a9abab5dedc7399a639'
            '31782ac6f397dfce957f6f3b2d5c6c4353aa0bc1f46edc403d7ae387b5ecee3a'
            '857d0a0eae217a941045d10877b59d9bc8fbcbba8e7cbe396d160ffd5317fa2c'
            '1838c60658eca84dfef148d179503b9df6c6e6b86ec6706d14d889829c51e532')
sha256sums_i686=('185b46aa5b77a801be8f7ac12a5739fe4efbe59ac8f2f3b0837d55a86ed1dffc')
sha256sums_x86_64=('b0df8228911bfe2a5c20e6ce748e81aac2b46b65618ef81d0ae2d3125cbdb3a4')
sha256sums_arm=('40872040a47ed6bc4abb52225b7adf90090c43c806f979558e2addd90e4079d9')
sha256sums_armv6h=('40872040a47ed6bc4abb52225b7adf90090c43c806f979558e2addd90e4079d9')
sha256sums_armv7h=('40872040a47ed6bc4abb52225b7adf90090c43c806f979558e2addd90e4079d9')
sha256sums_aarch64=('8beb4cb0c609b32d8a0d7b10035d4a881aaa44de23241e160883a4648d8a259a')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
