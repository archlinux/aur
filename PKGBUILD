# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=imgcat-go-bin
pkgver=1.0.23
pkgrel=1
pkgdesc="Display images and GIFs in the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/danielgatis/imgcat"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'imgcat' 'imgcat-bin')
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/imgcat_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/imgcat_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5617bb4b99b1bf8033c797dca49e7fc2378b35f4f2dda3dc3edaab96bc2861f0')
sha256sums_aarch64=('25069f5b0f673aaa1e55fc0872229993e0618b9801689345c99616e6def1c4f4')

package() {
  install -Dm755 "imgcat" "${pkgdir}/usr/bin/imgcat"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
