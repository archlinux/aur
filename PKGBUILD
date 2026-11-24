# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tsk-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Terminal task board for you and your agents"
arch=('x86_64' 'aarch64')
url="https://github.com/smarzban/tsk"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tsk-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tsk-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('05a6c4ac8ea3f7ca37ab0b103d6b29e790d562d8dc6560825a58ff41533eb26b')
sha256sums_aarch64=('778198d50cfbe49898ccb7230568304939a2536d1fd3f04be303c191e0e48ab5')

package() {
  install -Dm755 "tsk" "${pkgdir}/usr/bin/tsk"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
