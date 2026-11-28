# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=turbocrypt-bin
pkgver=0.9.10
pkgrel=1
pkgdesc="Encrypt and decrypt files, git repositories and directory trees"
arch=('x86_64' 'aarch64')
url="https://github.com/jedisct1/turbocrypt"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/turbocrypt_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/turbocrypt_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6272527205a81a9edc0c957233c9b469dce5f20175c13ff95f147195404bddce')
sha256sums_aarch64=('76fe84f0e196e387a7ae45950cbbbb6744ecbea400412a2ecc0ade53fc4e690f')

package() {
  install -Dm755 "turbocrypt" "${pkgdir}/usr/bin/turbocrypt"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
