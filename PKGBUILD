# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='A tool for service discovery, monitoring and configuration.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://www.consul.io"
license=('MPL')
depends=('glibc')
provides=('consul')
source=('consul.service')
source_i686=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_amd64.zip")
source_arm=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armelv5.zip")
source_armv6h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armhfv6.zip")
source_armv7h=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_armhfv6.zip")
source_aarch64=("https://releases.hashicorp.com/consul/${pkgver}/consul_${pkgver}_linux_arm64.zip")

sha256sums=('cace20b6db0643a4d10f6f14ab7ba23d047376aae48460b48fd265cb3eebc13c')
sha256sums_i686=('c3276f6b87035691d7dee13e18c5e8e4aa2c9fa506a5182eaa1fb9dde547e3aa')
sha256sums_x86_64=('7cd2e67ce2779c74ce18d880ccdfdc00a655eb71a6a7a956e6d3b71e7937ca0f')
sha256sums_arm=('d924c3744107975cc982a2d6c7444b843156364e5069fe81929757a3a8d875a5')
sha256sums_armv6h=('7790ac8514673d0a909ac8d6c50f342075b2dc8a69efd1148c012a13c6b03ed0')
sha256sums_armv7h=('7790ac8514673d0a909ac8d6c50f342075b2dc8a69efd1148c012a13c6b03ed0')
sha256sums_aarch64=('f35ebca5d8898b5117cc1f491509e8af46f87b93b5aeee8efdf4f30799efaaca')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
