# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.13.3
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

sha256sums=('097a9be3a970d9c3724dc31bd995b716ab812e5fb7f28e25fefd28bdf81068f9'
            '7ccda4002e0dfb1bbe1e0e672e552be9fd0db1eee814864d6b4114cf209ce4bc'
            '857d0a0eae217a941045d10877b59d9bc8fbcbba8e7cbe396d160ffd5317fa2c'
            '1838c60658eca84dfef148d179503b9df6c6e6b86ec6706d14d889829c51e532')
sha256sums_i686=('bc624f750751791c95d42b2a3f3ed16a637942528ca09b5625d3902d23ff7889')
sha256sums_pentium4=('bc624f750751791c95d42b2a3f3ed16a637942528ca09b5625d3902d23ff7889')
sha256sums_x86_64=('5370b0b5bf765530e28cb80f90dcb47bd7d6ba78176c1ab2430f56e460ed279c')
sha256sums_arm=('b9538525b3b4c10c1e1f4414b67861fae2810a8495489d0bc5e906e6f63ec1c3')
sha256sums_armv6h=('b9538525b3b4c10c1e1f4414b67861fae2810a8495489d0bc5e906e6f63ec1c3')
sha256sums_armv7h=('b9538525b3b4c10c1e1f4414b67861fae2810a8495489d0bc5e906e6f63ec1c3')
sha256sums_aarch64=('3c195602a2815c5fd670e9282455cd7213423da80fb353ee92a5d3e688da36d0')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
