# Maintainer: Vasiliy Bukharev <bvp-yar@ya.ru>

pkgname=consul-bin
pkgver=1.9.3
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
sha256sums_i686=('e893a6951f5b0485bf4783e0d1044f716827eea1ff12cebfc175803ddd71654d')
sha256sums_x86_64=('2ec9203bf370ae332f6584f4decc2f25097ec9ef63852cd4ef58fdd27a313577')
sha256sums_arm=('229171a740cc7205bc568f324aa76e0cdab914103ed87ebe6150b56385a14efd')
sha256sums_armv6h=('2394438e61ccb118c4165c1d5512a4d5649c48be1d13305c6585667cc7c7f9cd')
sha256sums_armv7h=('2394438e61ccb118c4165c1d5512a4d5649c48be1d13305c6585667cc7c7f9cd')
sha256sums_aarch64=('b7f3d8d297e62c8b8c0e96a9c2450d1b56ddc68c8db45403e9fd87037713aa58')
options=('!strip')

package() {
  install -Dm755 consul "$pkgdir"/usr/bin/consul
  install -Dm644 consul.service "$pkgdir"/usr/lib/systemd/system/consul.service
  install -d "$pkgdir"/etc/consul.d
}
