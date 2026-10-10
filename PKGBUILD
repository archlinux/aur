# Maintainer: czyt <czytcn@gmail.com>
pkgname=ocd-bin
pkgver=0.3.0
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
sha256sums_x86_64=('842a38933fccba87394f42a25b5d1b9fda84001c5833e163027fbeb153caf1b0')
sha256sums_aarch64=('3ea50eb439645b51d6469d303a9bbc9e99cf0b5a7c031e7516f316ef1250b8aa')

package() {
    local _bin="ocd-v${pkgver}-linux-x64"
    [[ "${CARCH}" == "aarch64" ]] && _bin="ocd-v${pkgver}-linux-arm64"

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/ocd"
}
