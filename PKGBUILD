# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.17.1
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
sha256sums_i686=('6130b9b1c7e78e9be0a7f80fd5e2282f954a8f62eedcfbde701975df7db02d4b')
sha256sums_pentium4=('6130b9b1c7e78e9be0a7f80fd5e2282f954a8f62eedcfbde701975df7db02d4b')
sha256sums_x86_64=('388889321d6aaf389ee87acc247ea9885e684a1581c8ebfbeab7348abd7c0214')
sha256sums_arm=('4cea522a3114c4d7b35ef39fc53a405520b9267691e9a88625559c6c39bf2946')
sha256sums_armv6h=('4cea522a3114c4d7b35ef39fc53a405520b9267691e9a88625559c6c39bf2946')
sha256sums_armv7h=('4cea522a3114c4d7b35ef39fc53a405520b9267691e9a88625559c6c39bf2946')
sha256sums_aarch64=('f36e1add92439cac710f2546beac97f9a6478fab9ff2342f3ce13f72ef2650de')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
