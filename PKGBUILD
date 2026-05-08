# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=ipinfo-cli
pkgname="${_pkgname}-bin"
pkgver=3.3.2
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('e08d010cdf37cda4db28ce62bdeaee781ec9aa59003f346eecce8aeb07854d0f')
sha256sums_armv7h=('4ce32959972a31d3362bb8841093d0f1744d63a2d9245d0df11150123983851d')
sha256sums_aarch64=('d42ff22ea976532729a07f902c87d09466a6a547ec70db21eca312816e481cea')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm64.tar.gz")

build() {
  find . -type f -name 'ipinfo_'${pkgver}'_*' -exec mv {} ipinfo \;
  strip ipinfo
}

package() {
  install -Dm755 "${srcdir}/ipinfo" -t "${pkgdir}/usr/bin"
}
