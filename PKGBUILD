# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sivtr-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Shared memory workspace for humans and AI agents"
arch=('x86_64')
url="https://github.com/Ariestar/sivtr"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sivtr-v${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('54128c4d03deb07e12cf89d672dcf08221f8ed69642aea5643c67b623ee4b395')

package() {
  install -Dm755 "sivtr-v${pkgver}-linux-x64/sivtr" "${pkgdir}/usr/bin/sivtr"
  install -Dm644 "sivtr-v${pkgver}-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "sivtr-v${pkgver}-linux-x64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
