# Maintainer: Nirvam <marvinbeeblebrox at gmail dot com>
_pkgauthor=matthart1983
_pkgname=diskwatch
pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Single-host, read-only disk diagnostics TUI (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'smartmontools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!strip')

source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/LICENSE"
    "README-${pkgver}.md::https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}/README.md"
)
source_x86_64=(
    "${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-x86_64.tar.gz"
)
source_aarch64=(
    "${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-aarch64.tar.gz"
)

sha256sums=('e78d969849862ac5abf431de8929c62759311a0cc58fd404eaf30996ab3f9162'
            'd245e0c31719cd2fdf3125b0464e4db0ffd7b4a368821ddf057a2e064b39cc95')
sha256sums_x86_64=('533a3d02e09c94cee92750dab066e49fa4599f280e5e1f00c6067f8d31dfe6c8')
sha256sums_aarch64=('7dc9d472a4c544b1cf2bee748b0128cf5266bfc79312456a5f5954ed12f1e105')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
