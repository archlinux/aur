# Maintainer: Yamashiro <dev cosmicheron com>

_bin='iso2god'
pkgname="${_bin}-rs-bin"
pkgdesc='A tool to convert Xbox 360 and original Xbox ISOs into an Xbox 360 compatible Games-On-Demand file format'
pkgver=1.8.1
pkgrel=2
arch=('x86_64' 'aarch64')
url='https://github.com/iliazeus/iso2god-rs'
license=('MIT')
provides=("$_bin")
conflicts=("$_bin")
depends=('gcc-libs' 'glibc')
_src="${pkgname}-${pkgver}"
_license="LICENSE-${pkgver}"
source=(
    "${_license}::https://raw.githubusercontent.com/iliazeus/iso2god-rs/refs/tags/v${pkgver}/LICENSE"
)
b2sums=('53a7a7f9e3d62a42462be417919ec11c082243074f21512def6a722561559357259d6b1e5e07f4d949dcd9f1d765cebc16e762dcb7deb0eff804bfcf427c2031')
source_x86_64=("${_src}-x86_64::${url}/releases/download/v${pkgver}/iso2god-x86_64-linux")
b2sums_x86_64=('b5e55e5cb81b0c0d3f1c150d4e9b8537289ae01b99504c853938ef55bb852efdb8b9d6320ac979240623556c21fae3207eeefe473313502fa26f0c41d6e44307')
source_aarch64=("${_src}-aarch64::${url}/releases/download/v${pkgver}/iso2god-aarch64-linux")
b2sums_aarch64=('8a5b7d1b0e9c4a493bfc675073df96901ee3771060e1e947a9e12726b68f275f08e6ba0329d75e344037663a0ce5114c9b40dda473e95d8c4cc94c8f12872be0')

package() {
    cd "${srcdir}"
    install -Dm755 "${_src}-${CARCH}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
