# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=vaku-bin
pkgver=2.12.1
pkgrel=1
pkgdesc="Extend the Vault API and CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/lingrino/vaku"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/vaku_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/vaku_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('1b1c76a4b1189bfe9030e875598cf1d9d6e6af4ce1efef1138dd332a4b996cf8')
sha256sums_aarch64=('7927a8437e3b206fb059c777bcb108f765cbcfc54cb689358398cba46eff99c2')

package() {
  install -Dm755 "vaku" "${pkgdir}/usr/bin/vaku"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
