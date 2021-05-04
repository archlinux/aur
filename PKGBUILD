# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.9.5
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
sha256sums_i686=('1376914a15a6ab8f9724f625471912d39ab3f40d3372a45b10ab4b5966bf243e')
sha256sums_x86_64=('76e46d6711c92ffe573710345dc8c996605822eb6dbb371f895f011cda260035')
sha256sums_arm=('8ec71f5916db513a38e0e8b3b102ae778c411eabdfc67983e44d8b0cfde8f8f6')
sha256sums_armv6h=('49744b92cbedd1a76f03bda87ac97bf2ef4df7487b4860a5ba6f5ab1032101a6')
sha256sums_armv7h=('49744b92cbedd1a76f03bda87ac97bf2ef4df7487b4860a5ba6f5ab1032101a6')
sha256sums_aarch64=('951fdad76ad641029f8644d9d1f061fbfab99d58ab6aa9e4569b1e073765cd41')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
