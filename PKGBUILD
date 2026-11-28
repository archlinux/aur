# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=favirecon-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Use favicons to improve target reconnaissance"
arch=('x86_64' 'aarch64')
url="https://github.com/edoardottt/favirecon"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/favirecon_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/favirecon_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('4bab5105bdbc2f6132f0bb29f59949a60893c74142ed8c3b68c0614eb6f10d61')
sha256sums_aarch64=('1dc1ad01afc505881d071cd2806cf18312d37fef42242a5511b0f549047aafcf')

package() {
  install -Dm755 "favirecon" "${pkgdir}/usr/bin/favirecon"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
