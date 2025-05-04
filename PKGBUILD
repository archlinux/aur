# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
pkgname="${_bin}-rs-bin"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=1.7.0
pkgrel=1
arch=('x86_64')
url='https://github.com/iliazeus/iso2god-rs'
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
depends=('gcc-libs' 'glibc')
_src="${pkgname}-${pkgver}"
_license="LICENSE-${pkgver}"
source=(
    "${_src}::${url}/releases/download/v${pkgver}/iso2god-x86_64-linux"
    "${_license}::https://raw.githubusercontent.com/iliazeus/iso2god-rs/refs/tags/v${pkgver}/LICENSE"
)
b2sums=(
    '6e95e83ee047a45d05f16e715fd0e5f9147caae7dd8fa0e720b73742d45bf3292b78a3c498194a22092b789cdb5bb77be4b2f163629afe85741884d1193988b8'
    '53a7a7f9e3d62a42462be417919ec11c082243074f21512def6a722561559357259d6b1e5e07f4d949dcd9f1d765cebc16e762dcb7deb0eff804bfcf427c2031'
)

package() {
    cd "${srcdir}"
    install -Dm755 "${_src}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
