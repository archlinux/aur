# Maintainer: ihipop <ihipop at gmail dot com>
_pkgname=ipinfo-cli
pkgname="${_pkgname}-bin"
pkgver=3.3.4
pkgrel=1
pkgdesc="Official Command Line Interface for the IPinfo API (IP geolocation and other types of IP data)"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://ipinfo.io"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${pkgname}-${pkgver}_x86_64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('3f4983cac632486cd0f1f76aff13f3bef522581b5e063e121a4db8c1f13c974f')
sha256sums_armv7h=('7f64fd9ef4f19aec9da5ab1b3199e42040ed207e0f78a2ffc61e26355faceb79')
sha256sums_aarch64=('0f4bbcb7e2b9fda17b1c7daccbe9d51c778411e0a1124b7366986ecc4b8f94df')
source_armv7h=("${pkgname}-${pkgver}_armv7h.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm.tar.gz")
source_aarch64=("${pkgname}-${pkgver}_aarch64.tar.gz::https://github.com/ipinfo/cli/releases/download/ipinfo-${pkgver}/ipinfo_${pkgver}_linux_arm64.tar.gz")

build() {
  find . -type f -name 'ipinfo_'${pkgver}'_*' -exec mv {} ipinfo \;
  strip ipinfo
}

package() {
  install -Dm755 "${srcdir}/ipinfo" -t "${pkgdir}/usr/bin"
}
