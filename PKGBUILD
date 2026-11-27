# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rsstig-bin
pkgver=0.2.2
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
sha256sums_x86_64=('1a26415ded27a855858dc9b53a93d743cad3fd1960ff5994a19e7efaf93b134b')
sha256sums_aarch64=('10a66e4f57250b34f2a47879d587e91ef0c312bff35e3ccaff869c894fe41879')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/rsstig"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
