# Maintainer: czyt <czytcn@gmail.com>
pkgname=ocd-bin
pkgver=0.2.4
pkgrel=2
pkgdesc="CLI for open-compute - self-hosted Cloudflare Workers-compatible platform"
arch=('x86_64' 'aarch64')
url="https://open-compute.dev"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=('ocd')
conflicts=('ocd')
source_x86_64=("ocd-v${pkgver}-linux-x64::https://github.com/elliothux/open-compute/releases/download/v${pkgver}/ocd-v${pkgver}-linux-x64")
source_aarch64=("ocd-v${pkgver}-linux-arm64::https://github.com/elliothux/open-compute/releases/download/v${pkgver}/ocd-v${pkgver}-linux-arm64")
sha256sums_x86_64=('8829a5bcb334dd3bbd8dc949ad9a2afdfe0e1fef44035c041556cd12087c586f')
sha256sums_aarch64=('b952e61acdedcbde9bafddc30ebd7b2d01f670fd7bc679427be020dbff4bf1b1')

package() {
    local _bin="ocd-v${pkgver}-linux-x64"
    [[ "${CARCH}" == "aarch64" ]] && _bin="ocd-v${pkgver}-linux-arm64"

    install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/usr/bin/ocd"
}
