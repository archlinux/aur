# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pphack-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Client-side prototype pollution scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/edoardottt/pphack"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/pphack_${pkgver}_linux_amd64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::${_dl}/pphack_${pkgver}_linux_arm64.zip")
sha256sums_x86_64=('365cf51f09efd3daff51a7671b30bdd328e7ac462ccb975c83815b564f453b7b')
sha256sums_aarch64=('c17d20b0ba57cd235888efab6a00c54f36a92993504db0b4042da1b3d342f63c')

package() {
  install -Dm755 "pphack" "${pkgdir}/usr/bin/pphack"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
