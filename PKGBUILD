# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fievel-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Replace mouse movements with the keyboard"
arch=('x86_64')
url="https://github.com/MontyTheSoftwareEngineer/fievel"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/fievel-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('83143b344cd214c6b42bcbc2e95ccdbf44c1f85962f463c3178a86f76d135163')

package() {
  install -Dm755 "fievel" "${pkgdir}/usr/bin/fievel"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
