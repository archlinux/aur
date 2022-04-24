# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.12.0
pkgrel=1
pkgdesc='A tool for service discovery, monitoring and configuration.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.consul.io"
license=('MPL')
depends=('glibc')
provides=('consul')
source=('consul.service'
        'consul.hcl'
        'consul.sysusers'
        'consul.tmpfiles')
source_i686=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_386.zip")
source_pentium4=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_armv6h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_armv7h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm.zip")
source_aarch64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm64.zip")

sha256sums=('b2eea8fe453b322bb636afbde3253cb035b2f9d902da7a9abab5dedc7399a639'
            '31782ac6f397dfce957f6f3b2d5c6c4353aa0bc1f46edc403d7ae387b5ecee3a'
            '857d0a0eae217a941045d10877b59d9bc8fbcbba8e7cbe396d160ffd5317fa2c'
            '1838c60658eca84dfef148d179503b9df6c6e6b86ec6706d14d889829c51e532')
sha256sums_i686=('07eae82bf31630a195e5873202442ba391b39ef6a7b6c34e6e0f81a6efdce11a')
sha256sums_pentium4=('07eae82bf31630a195e5873202442ba391b39ef6a7b6c34e6e0f81a6efdce11a')
sha256sums_x86_64=('109e2077236cae4560b2fa3dce7974ef58d6a7093d72494614d875e5c86e3b2c')
sha256sums_arm=('d3f8a8055df50320ad3396818f83d7d2742c18f2e225f6866c8eb50ca5cea119')
sha256sums_armv6h=('d3f8a8055df50320ad3396818f83d7d2742c18f2e225f6866c8eb50ca5cea119')
sha256sums_armv7h=('d3f8a8055df50320ad3396818f83d7d2742c18f2e225f6866c8eb50ca5cea119')
sha256sums_aarch64=('2d22f648af307b63800d291554d3c312beff01d2b4fc8437aeb004935c6bd0cb')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
