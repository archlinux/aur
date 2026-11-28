# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=duckdb-otlp-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Stream, store and query OpenTelemetry data in DuckDB"
arch=('x86_64' 'aarch64')
url="https://github.com/smithclay/duckdb-otlp"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/smithclay/duckdb-otlp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/duckdb-otlp-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/duckdb-otlp-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('a457b2e4e0dafab867e52b8deeaac344681706c5020b91556f69d90dbc973894')
sha256sums_x86_64=('df84e08a9774dd106da5c11847544090babff6e992bc961f90b002ebb06c6ef2')
sha256sums_aarch64=('6dc84681d69fb534351966e2bc1d24ee13b545fbb302cd7c3aa3f11d44dd2906')

package() {
  install -Dm755 "duckdb-otlp" "${pkgdir}/usr/bin/duckdb-otlp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
