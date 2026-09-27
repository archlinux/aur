# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=darkubectl-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="kubectl-like access to the Hamravesh Darkube platform"
arch=('x86_64' 'aarch64')
url="https://github.com/rahacloud/darkubectl"
license=('GPL-3.0-only')
provides=('darkubectl')
conflicts=('darkubectl')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/darkubectl_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/darkubectl_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('4b575dd10a98ee08b4ccb1c58a180fca3f59424e5a4fff74906188276b4f8e97')
sha256sums_aarch64=('1d0e0b90db893c98847aa7d42916d03fa00af168d7dc600dec1e54b7f018f909')

package() {
  install -Dm755 "${srcdir}/darkubectl" "${pkgdir}/usr/bin/darkubectl"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
