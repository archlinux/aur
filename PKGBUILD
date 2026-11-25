# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=fireworq-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Fireworq is a lightweight, high-performance, language-independent job queue system"
arch=('x86_64')
url="https://github.com/fireworq/fireworq"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_dl}/fireworq_linux_amd64.zip")
sha256sums_x86_64=('e5975cd7d0d40ba92b761592417c7b51f8d78f082d4949bede9ac72d311dd85c')

package() {
  install -Dm755 "fireworq" "${pkgdir}/usr/bin/fireworq"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
