# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.11.4
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
sha256sums_i686=('dd2f9af4edc263168ae5e03f97fcf80e72ca59753a68707254ff36a648f8876a')
sha256sums_x86_64=('5155f6a3b7ff14d3671b0516f6b7310530b509a2b882b95b4fdf25f4219342c8')
sha256sums_arm=('8f2c504ff87228dfaa74fc9552e85767962644dbb728cf34884926375a1486d7')
sha256sums_armv6h=('8f2c504ff87228dfaa74fc9552e85767962644dbb728cf34884926375a1486d7')
sha256sums_armv7h=('8f2c504ff87228dfaa74fc9552e85767962644dbb728cf34884926375a1486d7')
sha256sums_aarch64=('97dbf36500dcefbe463f070471602992d148cb2fe91db7e37319e1b9c809f1f0')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
