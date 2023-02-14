# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.14.4
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
sha256sums_i686=('33fb6ee755802edd35585a615c3901bbc5409fcd4137bf80d9f0544e111472d4')
sha256sums_pentium4=('33fb6ee755802edd35585a615c3901bbc5409fcd4137bf80d9f0544e111472d4')
sha256sums_x86_64=('eafb7c853ce9cc1536bffa99325f8df365ff70a3b83c037836e63964a8adfd7a')
sha256sums_arm=('d61386ff3d99f23686e3525b73cb0732472ef38a6a37430d5a0cfb4603576b97')
sha256sums_armv6h=('d61386ff3d99f23686e3525b73cb0732472ef38a6a37430d5a0cfb4603576b97')
sha256sums_armv7h=('d61386ff3d99f23686e3525b73cb0732472ef38a6a37430d5a0cfb4603576b97')
sha256sums_aarch64=('9baf47a75c95945824da0629bc0b3f7b1ca55015e8c9ce7579d9a431a90b721c')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
