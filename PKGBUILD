# Maintainer: czyt <czytcn@gmail.com>
pkgname=ocd-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="CLI for open-compute - self-hosted Cloudflare Workers-compatible platform"
arch=('x86_64' 'aarch64')
url="https://open-compute.dev"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=('ocd')
conflicts=('ocd')
source_x86_64=("ocd-v${pkgver}-linux-x64::https://github.com/elliothux/open-compute/releases/download/v${pkgver}/ocd-v${pkgver}-linux-x64")
source_aarch64=("ocd-v${pkgver}-linux-arm64::https://github.com/elliothux/open-compute/releases/download/v${pkgver}/ocd-v${pkgver}-linux-arm64")
sha256sums_x86_64=('75e85beb26a900af87f6d091e6efa620a176cf7411ba98be72be9aaa02a4e5f2')
sha256sums_aarch64=('052a7e73656d2ba9eebdc133d2111d96e76f74f8ab024ed142e92c4462590b6c')

package() {
    local _bin="ocd-v${pkgver}-linux-x64"
    [[ "${CARCH}" == "aarch64" ]] && _bin="ocd-v${pkgver}-linux-arm64"

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/ocd"
}
