# Maintainer: Rumato Estorsky <@rumatoest at x.com>
pkgname=apate
pkgdesc="Declarative any API prototyping/mocking server. Use TOML based DSL with Rhai scripting capabilities"
url="https://github.com/rustrum/apate"
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')

pkgver="0.2.1"
_tag="v${pkgver}"
_asset="llama-${_tag}-bin-linux-cuda-13.3-x64.tar.gz"
_source="${pkgname}_${_tag}"

provides=('apate')
depends=()
conflicts=()

source_x86_64=(
    "https://github.com/rustrum/apate/releases/download/${_tag}/apate-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "https://github.com/rustrum/apate/releases/download/${_tag}/apate-aarch64-unknown-linux-gnu.tar.gz"
)

# Architecture-specific checksums
sha256sums_x86_64=('dda8a099ddb42f879f85c52576bc79bc845d3d8a29df1948f267674b3e5518d5')
sha256sums_aarch64=('c0fb14be71f36477594761f4b589d461e8b8c408c13c0a03040d6778017a5cc1')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
