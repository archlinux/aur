# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=runwisp-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Cron job manager and process supervisor in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/runwisp/runwisp"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/runwisp/runwisp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/runwisp-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/runwisp-linux-arm64.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('3acf99a4592d2a66ffde0c295be8190e5ca40ce485d76a20fb12d47229327b95')
sha256sums_aarch64=('7b1bf5cd7713f8535cc5928cb176ba059d4dc69a643b46bd3c48bb01e6045277')

package() {
  install -Dm755 "runwisp" "${pkgdir}/usr/bin/runwisp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
