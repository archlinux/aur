# Maintainer: Rumato Estorsky <@rumatoest at x.com>
pkgname=apate
pkgdesc="Declarative any API prototyping/mocking server. Use TOML based DSL with Jinja templeas and Rhai scripting."
url="https://github.com/rustrum/apate"
pkgrel=1
arch=('x86_64' 'aarch64')
license=('MIT')

pkgver="0.3.0"
_tag="v${pkgver}"
_source="${pkgname}_${_tag}"

provides=('apate')
depends=()
conflicts=()

source_x86_64=(
    "apate-x86_64_${_tag}.tar.gz::https://github.com/rustrum/apate/releases/download/${_tag}/apate-x86_64-unknown-linux-gnu.tar.gz"
)
source_aarch64=(
    "apate-aarch64_${_tag}.tar.gz::https://github.com/rustrum/apate/releases/download/${_tag}/apate-aarch64-unknown-linux-gnu.tar.gz"
)

# Architecture-specific checksums
sha256sums_x86_64=('004dd53562616e6a98888aed0023bdac5773484c35901ac9cf91d2db0923377e')
sha256sums_aarch64=('383c01350286d8b5d5ab04cc9bb2c2655ec602d37c7dd224467d5d7950b2f64d')

package() {
  cd "${srcdir}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
