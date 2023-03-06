# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.15.0
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
sha256sums_i686=('fb1a7794888944b0101c7f71bdd42593673a80206e945797ea4ecf125a78f6e9')
sha256sums_pentium4=('fb1a7794888944b0101c7f71bdd42593673a80206e945797ea4ecf125a78f6e9')
sha256sums_x86_64=('62a358ff2c3c08d19f15a92ea3130b05b547ab5a767ae13454eab7655a718c24')
sha256sums_arm=('ab9ba2eb19375c82f38f4a9081a9c764557ec69cd5b41508ee30c7b7d50ea09e')
sha256sums_armv6h=('ab9ba2eb19375c82f38f4a9081a9c764557ec69cd5b41508ee30c7b7d50ea09e')
sha256sums_armv7h=('ab9ba2eb19375c82f38f4a9081a9c764557ec69cd5b41508ee30c7b7d50ea09e')
sha256sums_aarch64=('2dde0e0d9055baa5eb66ebfe9ca81c34ca8e405fb2e8ff61315c0e2aa12c6d7d')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
  install -Dm644 "${srcdir}/consul.hcl" "${pkgdir}/etc/consul.d/consul.hcl"
  install -Dm644 "${srcdir}/consul.sysusers" "${pkgdir}/usr/lib/sysusers.d/consul.conf"
  install -Dm644 "${srcdir}/consul.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/consul.conf"
}
