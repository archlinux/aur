# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kekkai-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Detect file tampering using content hashes stored in S3"
arch=('x86_64' 'aarch64')
url="https://github.com/catatsuy/kekkai"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kekkai-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kekkai-linux-arm64.tar.gz")
sha256sums_x86_64=('9243469edff116bfed6710750b3df5f56e2e07710c6ea5b17a6d469605472e72')
sha256sums_aarch64=('c5339119fd2d6637cb21cc4e2e843a9be7d91c248d8e5b2075c0811d3422fc0a')

package() {
  install -Dm755 "kekkai" "${pkgdir}/usr/bin/kekkai"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
