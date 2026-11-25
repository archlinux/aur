# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=cli-printing-press-bin
pkgver=4.36.1
pkgrel=1
pkgdesc="Every API has a secret identity"
arch=('x86_64' 'aarch64')
url="https://github.com/mvanhorn/cli-printing-press"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/cli-printing-press_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/cli-printing-press_linux_arm64.tar.gz")
sha256sums_x86_64=('f26c7c731da35183afc4df636634cae77de6f3d1518e8db9a820f28065b720f4')
sha256sums_aarch64=('4d57f179fbe9c26b9cb8a9b514a1c48e6e7c1a0421b59a4ebb4e8534032687b3')

package() {
  install -Dm755 "cli-printing-press" "${pkgdir}/usr/bin/cli-printing-press"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
