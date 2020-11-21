# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.8.6
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
sha256sums_i686=('a3de7e34bfe56e5523c3539e042dda93657fd964e30ff7705fa72f7e55477169')
sha256sums_x86_64=('b7e9d43da34a1b44dfe2aead5140554c63e32cb4944d7acf74a87f33ce0af3f6')
sha256sums_arm=('bb6bfb6d9708763acc1262b97e0e4d2d2af74fd1d07e38ecee94c22e9b98b8e7')
sha256sums_armv6h=('5784cb33014cabb3cb78ee15424dc821d341e68b7815809559c655923875ecc3')
sha256sums_armv7h=('5784cb33014cabb3cb78ee15424dc821d341e68b7815809559c655923875ecc3')
sha256sums_aarch64=('acec675270a5cf63bb9a4803bc321acaf1f36ee1edf08498557bf62ba63cfea5')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
