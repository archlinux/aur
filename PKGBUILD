# Maintainer: Severi Jääskeläinen <severi.jaaskelainen@gmail.com>
pkgname=sentinelcli
pkgver=0.1.9
pkgrel=1
pkgdesc="The official Sentinel CLI client"
arch=("x86_64")
url="https://github.com/sentinel-official/cli-client"
license=("Apache-2.0")
depends=(openresolv wireguard-tools)
makedepends=(go)
backup=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sentinel-official/cli-client/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("bd6f116e8d7ccd60c8c73a31545e56a4547a05d17d9a24477418d2b1d0ebe9a5")
_dir="cli-client-${pkgver}"
build() {
  cd "${_dir}"
  GOOS="linux" GOARCH="amd64" make build
}
package() {
  install -Dm0755 "${_dir}/build/${pkgname}--linux-amd64" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${_dir}/LICENSE" 
}
