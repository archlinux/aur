# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=3code-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Economical coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/capocasa/3code"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/3code-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/3code-linux-arm64.tar.gz")
sha256sums_x86_64=('a55656ad9f684b569ddd855ec4b000d5185f080c67aaf45e2b6f3242bedaa237')
sha256sums_aarch64=('a5cbd39bc01aaef3614b2702c3f1b0e5c50151ce889dc928f0d01d928fda978a')

package() {
  install -Dm755 "3code" "${pkgdir}/usr/bin/3code"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
