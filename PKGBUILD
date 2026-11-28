# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=btab-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Blue team security analysis toolbox"
arch=('x86_64')
url="https://github.com/Martin2877/btab"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Martin2877/btab/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/btab_v${pkgver}_linux_amd64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('a9ebc943b98672058d91405eacda69c064d98a0667ece741579dd7561145304b')

package() {
  install -Dm755 "./btab" "${pkgdir}/usr/bin/btab"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
