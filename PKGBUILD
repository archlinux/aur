# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=differ-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Review and comment on what your coding agent changed, from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/JanSmrcka/differ"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/differ_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/differ_linux_arm64.tar.gz")
sha256sums_x86_64=('878c416f5234d52a5b11da7868b69ce42078e52711076863254dde5fbce5846d')
sha256sums_aarch64=('0d98b1c99061a8ecf3a438c4a480dc4c5f81732211f54ab0597a1806e724f15e')

package() {
  install -Dm755 "differ" "${pkgdir}/usr/bin/differ"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
