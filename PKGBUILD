# Maintainer: Nirvam <marvinbeeblebrox at gmail dot com>

pkgname=wx-cli-bin
pkgver=0.3.0
pkgrel=2
pkgdesc="WeChat local data CLI with daemon architecture"
arch=('x86_64' 'aarch64')
url="https://github.com/jackwener/wx-cli"
license=('Apache-2.0')
provides=('wx-cli')
conflicts=('wx-cli')
depends=('gcc-libs' 'glibc')
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("wx-cli-x86_64::${url}/releases/download/v${pkgver}/wx-linux-x86_64")
source_aarch64=("wx-cli-aarch64::${url}/releases/download/v${pkgver}/wx-linux-arm64")
sha256sums=('cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('efc43bc064a42c74f543999f7afadb12ced82a1e3151c3146450c7259ec8a8ed')
sha256sums_aarch64=('31e568a840e35c6a15672f0828cf3930e2f5de3b354161ac666c3f88bb96380e')

package() {
    cd "${srcdir}"
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wx-cli-x86_64" "${pkgdir}/usr/bin/wx-cli"
    elif [[ "${CARCH}" == "aarch64" ]]; then
        install -Dm755 "wx-cli-aarch64" "${pkgdir}/usr/bin/wx-cli"
    fi
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
