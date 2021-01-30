# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.9.2
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
sha256sums_i686=('fcd83f9e395640af82fd1cbadb23906652c57b96488557c45dae7054d9632252')
sha256sums_x86_64=('5141b2e7f54b51e07601d2b4ff1853f1d9b8e26b26bfb55281a8c47d8581352e')
sha256sums_arm=('c026b4c040dca0fff684683a1c78b338ad15a43b386a25aa8033d353f3b69dea')
sha256sums_armv6h=('e542a30043f2d15cdba36ed97bfa7989bbf5897bdf9e2e9819e86883b1a115c5')
sha256sums_armv7h=('e542a30043f2d15cdba36ed97bfa7989bbf5897bdf9e2e9819e86883b1a115c5')
sha256sums_aarch64=('e544435eebcc5939f7f12b0666fb960ae127edbb6402ab305c7ea130032f0aab')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
