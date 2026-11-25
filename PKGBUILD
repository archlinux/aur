# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=scriberr-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="Self-hosted AI audio transcription"
arch=('x86_64' 'aarch64')
url="https://github.com/rishikanthc/Scriberr"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/Scriberr_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/Scriberr_Linux_arm64.tar.gz")
sha256sums_x86_64=('c5f683e1d7f60da291f0b6d25845aacf6cf764cd468f0bac6ba4194acef65f58')
sha256sums_aarch64=('39a92325bd2a5c791ff37ebd046370091a3d07d7a5a250fb048db9a7d6c49860')

package() {
  install -Dm755 "scriberr" "${pkgdir}/usr/bin/scriberr"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
