# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dorea-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Key-value data storage system"
arch=('x86_64')
url="https://github.com/mrxiaozhuox/dorea"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/mrxiaozhuox/dorea/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dorea_v${pkgver}_x86_64-unknown-linux-musl.tar.gz")
sha256sums=('d708d35203304083137b3b5c28eaf65f802de62b0b52afe9736f8b804302cbad')
sha256sums_x86_64=('af43b30dd81be2b3b5bb22e678ec72f2d09fbaa75419ab8278dc4fdb01900309')

package() {
  install -Dm755 "dorea-cli" "${pkgdir}/usr/bin/dorea-cli"
  install -Dm755 "dorea-server" "${pkgdir}/usr/bin/dorea-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
