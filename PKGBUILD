# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=ipinfo-cli
pkgname="${_pkgname}-bin"
pkgver=3.3.3
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('893d796a732b19ff3cfbe60c0a6e7e11981cf786fb989194744cfc3f1a00c96f')
sha256sums_armv7h=('c4ce64da7f47868b26ff83dae73a1d11ab9567997db613503117267f5563d59b')
sha256sums_aarch64=('597cff5df356a5f2203c29227c06799aabbefaf881074d9837e4363d5d534ff7')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm64.tar.gz")

build() {
  find . -type f -name 'ipinfo_'${pkgver}'_*' -exec mv {} ipinfo \;
  strip ipinfo
}

package() {
  install -Dm755 "${srcdir}/ipinfo" -t "${pkgdir}/usr/bin"
}
