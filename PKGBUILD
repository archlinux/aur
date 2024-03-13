# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=envkey
pkgname="${_pkgname}-cli-bin"
pkgver=2.5.0
pkgrel=1
pkgdesc="Secure, human-friendly, cross-platform secrets and config.CLI version."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.envkey.com/"
_ghurl="https://github.com/envkey/envkey"
_dlurl="https://envkey-releases.s3.amazonaws.com/cli"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc>=2.38'
    'gcc-libs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/envkey/envkey/cli-v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_dlurl}/release_artifacts/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_dlurl}/release_artifacts/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('d3e78cbc2e92dfabac2dc9c8a5cd22e702cba2a65455c265e5bed3a1d447a704')
sha256sums_aarch64=('663478e4d6f0f5cf921b580b50dc3708288f1d45dd15d1cc496b221b2fa4f117')
sha256sums_x86_64=('bd23f646dbc1fa2c87ad4586338fffe3c09ea42b64237031c5f3a580c27f30dd')
package() {
    install -Dm755 "${srcdir}/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}