# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rsstig-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="An unconventional terminal RSS/Atom reader"
arch=('x86_64' 'aarch64')
url="https://github.com/indium114/rsstig"
license=('Unlicense')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/indium114/rsstig/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/rsstig_Linux_x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/rsstig_Linux_arm64")
sha256sums=('6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e')
sha256sums_x86_64=('f063b317fce3ab68ef0b3d8082384314449e21f5dfe976534c105526eb698a4a')
sha256sums_aarch64=('d3de10214648c7f3ec09e2ead3b57f6bb2b20eef9abd177c1d3216cc9aa85a58')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rsstig"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
