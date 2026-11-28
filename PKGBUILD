# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=entire-brain-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Memory layer for your Git repository"
arch=('x86_64' 'aarch64')
url="https://github.com/entireio/entire-brain"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/entireio/entire-brain/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/entire-brain_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/entire-brain_${pkgver}_linux_arm64.tar.gz")
sha256sums=('7e763e0342febb10b46d5ea3d513c7d07a59dc09be3c508d01de899b6086fe25')
sha256sums_x86_64=('60c456a176e2a848336a7627b3c406cc9221badc5fa50c577f06c7474f610970')
sha256sums_aarch64=('5663e9c30ab4f740560db83f8c5c55e575dc6aa2afa9d6d6103f860011243335')

package() {
  install -Dm755 "entire-brain" "${pkgdir}/usr/bin/entire-brain"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
