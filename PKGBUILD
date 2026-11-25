# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kividb-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="Multi-threaded Redis and Valkey compatible server with full-text and vector search"
arch=('x86_64' 'aarch64')
url="https://github.com/kividbio/kividb"
license=('AGPL-3.0-only')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kividb-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kividb-linux-aarch64.tar.gz")
sha256sums_x86_64=('3af9821b71801006835b7fc208a16a890fb0c8fa709ffabf2ad115641da9c51d')
sha256sums_aarch64=('03ad857dae7ea37fc220f699be862b4a292ad31b5b6391ee29df538fdf023fdd')

package() {
  install -Dm755 "kividb/kividb" "${pkgdir}/usr/bin/kividb"
  install -Dm644 "kividb/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
