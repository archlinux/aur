# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='A tool for service discovery, monitoring and configuration.'
#arch=('i686')
#arch=('x86_64')
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
sha256sums_i686=('465c41a0c2037aeaca546910c0e7f940c7d6917d56064066a8cfbee203d3e150')
sha256sums_x86_64=('409b964f9cec93ba4aa3f767fe3a57e14160d86ffab63c3697d188ba29d247ce')
sha256sums_arm=('a2cdb9a6079ef04e6f61aa57bbca35a4024493253646821b46d2ba0851302ed4')
sha256sums_armv6h=('1df4124af719c93067aa8fca8848d16c99f8e9d2b5924da89a0f399b361c993c')
sha256sums_armv7h=('1df4124af719c93067aa8fca8848d16c99f8e9d2b5924da89a0f399b361c993c')
sha256sums_aarch64=('71b3c5551fbd297efbee74f95b138244202fcdd745b80033b99e1bc3d06043ee')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
