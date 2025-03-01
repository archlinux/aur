# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=nali-nt
pkgver="1.7.5"
pkgrel="2"
pkgdesc="集成了 NextTrace LEOMOEAPI 的 nali; 一个查询 IP 地理信息和 CDN 服务提供商的离线终端工具. An offline tool for querying IP geographic information and CDN provider."
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv6h"
    "armv7h"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "mipsel"
    "ppc64"
    "ppc64le"
    "riscv64"
    "s390x"
)
makedepends=("go")
url="https://nxtrace.github.io/nali/"
license=("MIT")

source=("https://github.com/nxtrace/nali/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=("3331ec2fc4a892bac0afb89f290989f86f6dd8ea0e3a43f8e6778df2456ba453")

build() {
    cd "${srcdir}/nali-${pkgver}"
    go build
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/nali-${pkgver}/nali" "${pkgdir}/usr/bin/nali-nt"
}
