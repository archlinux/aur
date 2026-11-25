# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=afrog-bin
pkgver=3.5.12
pkgrel=1
pkgdesc="A Security Tool for Bug Bounty, Pentest and Red Teaming"
arch=('x86_64' 'aarch64')
url="https://github.com/zan8in/afrog"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/afrog_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/afrog_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('d706f26b98a4a270660e86c2ff5485082dd2673697fe4183cd9e5d38a701c3da')
sha256sums_aarch64=('414b8541e8293ea38206ff31584176db4a2a52b98a2ae17ee9981446b3d9b29a')

package() {
  install -Dm755 "afrog" "${pkgdir}/usr/bin/afrog"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
