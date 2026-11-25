# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=apk-medit-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="memory search and patch tool on debuggable apk without root & ndk"
arch=('x86_64' 'aarch64')
url="https://github.com/sterrasec/apk-medit"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/medit_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/medit_linux_arm64.tar.gz")
sha256sums_x86_64=('7c023c82061010da3cdc4597c38d8c5609bf54cd55b0b526c058b00fedec4f68')
sha256sums_aarch64=('f48c26863f83fec917339fd09a68e9b9075b312d92dfbd6de22bcee3ea80cc6c')

package() {
  install -Dm755 "medit" "${pkgdir}/usr/bin/medit"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
