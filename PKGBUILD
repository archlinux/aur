# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=readflow-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Versatile and simple read-it-later news reader"
arch=('x86_64' 'aarch64')
url="https://github.com/ncarlier/readflow"
license=('AGPL-3.0-only')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_dl}/readflow-linux-amd64.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_dl}/readflow-linux-arm64.tgz")
sha256sums_x86_64=('ea1b606ab6b0e1d0c671fd5fc9ff6ab24141d5b1fed8c1c6fd2489041edb7eaa')
sha256sums_aarch64=('3f0eae0913fc2896192bc35a3372876bbf860a9a13f01a03ca74c9e23780840d')

package() {
  install -Dm755 "readflow" "${pkgdir}/usr/bin/readflow"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
