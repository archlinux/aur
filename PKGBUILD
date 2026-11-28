# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=archivista-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="Graph and storage service for in-toto attestations"
arch=('x86_64' 'aarch64')
url="https://github.com/in-toto/archivista"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/archivista_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/archivista_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1ed2a61c2c8bd6d41243954209d66e5b2816898a568da87cb8534aab3b6032c8')
sha256sums_aarch64=('db225f64e97c8a5e8611c29b6d0fc9e813dcf4af24cfb4835a4ebec60806b29d')

package() {
  install -Dm755 "archivista" "${pkgdir}/usr/bin/archivista"
  install -Dm755 "archivistactl" "${pkgdir}/usr/bin/archivistactl"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
