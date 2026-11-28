# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=savepoint-bin
pkgver=0.3.12
pkgrel=1
pkgdesc="Command watcher that commits when you fix errors"
arch=('x86_64' 'aarch64')
url="https://github.com/NamtaoProductions/savepoint"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/savepoint-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/savepoint-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e427f18385adaaaa6cbd9fb7f6e7679d1b7c110561a985544856b1a947ce121b')
sha256sums_aarch64=('37fea58ee745e0cc57921aceaad41cb418a37f13ea8c7c0e0df0a4ff531cbc06')

package() {
  install -Dm755 "savepoint-${pkgver}/savepoint" "${pkgdir}/usr/bin/savepoint"
  install -Dm644 "savepoint-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "savepoint-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
