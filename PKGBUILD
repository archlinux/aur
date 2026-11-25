# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=easeprobe-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="A simple, standalone, and lightweight tool that can do health/status checking, written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/megaease/easeprobe"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/megaease/easeprobe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/easeprobe-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/easeprobe-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('75304e336ae5e7b6a0002b2076d2c77acdd08be599246df8d28666621e95698d')
sha256sums_aarch64=('85f4a8a154c703737fd603906b6a5c5408a2dbd917814cdeab79784f091ba149')

package() {
  install -Dm755 "bin/easeprobe" "${pkgdir}/usr/bin/easeprobe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
