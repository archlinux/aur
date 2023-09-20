# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.16.2
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
sha256sums_i686=('1ad96afe569532a1a01247ca3e5da8cb3c501434fbafff345fdfa676c0fa3dd3')
sha256sums_pentium4=('1ad96afe569532a1a01247ca3e5da8cb3c501434fbafff345fdfa676c0fa3dd3')
sha256sums_x86_64=('2c87fffbb8abb3ba776519514db659f174a7c5b65faad7818457049ca9ff338b')
sha256sums_arm=('191a94dd2929f92d885ae0b6ff8a6b987ec6e3a5b15057c21a7b6279a407ae53')
sha256sums_armv6h=('191a94dd2929f92d885ae0b6ff8a6b987ec6e3a5b15057c21a7b6279a407ae53')
sha256sums_armv7h=('191a94dd2929f92d885ae0b6ff8a6b987ec6e3a5b15057c21a7b6279a407ae53')
sha256sums_aarch64=('1903a5ecb6e17437bb6e0ada5e9ef403fd791ec1130c52cd76508260c4a2a719')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
