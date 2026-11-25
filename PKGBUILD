# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=betteralign-bin
pkgver=0.16.1
pkgrel=1
pkgdesc="Detect and fix suboptimal struct field layout in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/dkorunic/betteralign"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/betteralign_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/betteralign_Linux_arm64.tar.gz")
sha256sums_x86_64=('1dbfa421f388d381f173e9b99aec84fd5eaeeaa445fc0c506802c388aa6b785f')
sha256sums_aarch64=('1e7f38095a47292173fbe94e2b05e863fe977fc27ab4ea3a452a8309032d8e47')

package() {
  install -Dm755 "betteralign" "${pkgdir}/usr/bin/betteralign"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
