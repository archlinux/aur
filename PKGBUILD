# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vera-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Local code search with BM25, vector similarity and reranking"
arch=('x86_64' 'aarch64')
url="https://github.com/VeraTools/vera"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/VeraTools/vera/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/vera-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/vera-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('012a6c80a8db91d19822d5f9582fdbdfbe515f16838e8329e4be339c97f869b3')
sha256sums_x86_64=('11e359acf7d453fad27e3879657be986a7a7bb7aa181296f36820c8b8539314c')
sha256sums_aarch64=('9564e7b27ea11683d44a61424ba5783ea966f869e4b3d603140bb5a5586d5f97')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="vera-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="vera-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/vera" "${pkgdir}/usr/bin/vera"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
