# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.9.1
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
sha256sums_i686=('6fff43c29d4ea5ff5ce8b365c157a23a798881493788d48f619b5894799a72fa')
sha256sums_x86_64=('9ba45ec6eb3e762444f077ae06e407ca5161d46785d725d7b5ea0c4d5cd5a99b')
sha256sums_arm=('16d81bfdb51f5fd71210bf5c4d5d40a18f63cf3bef08b6f78c8e0073fc2de99a')
sha256sums_armv6h=('a8d85eb04144a7e278916238de94c94cdaca56f9adcd7761777f09c035fe74e8')
sha256sums_armv7h=('a8d85eb04144a7e278916238de94c94cdaca56f9adcd7761777f09c035fe74e8')
sha256sums_aarch64=('80a05bf3a3d9c18f0ef952eff8e6e0de8f7205060916e351c4cd3f2418ed7900')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
