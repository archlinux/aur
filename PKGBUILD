# Maintainer: Dawid Motyka <cryptonose2@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cryptonose
pkgver=2.19.1
pkgrel=1
pkgdesc="A free and open source desktop application that keeps track of significant price changes within small time periods (5 minutes, 30 minutes) on cryptocurrency markets"
arch=('x86_64')
url='https://dawidm.github.io/cryptonose2'
license=('MIT')
depends=('libnet'
         'libxtst'
         'libxrender'
         'freetype2'
         'alsa-lib')
source=("${pkgname}-${pkgver}.deb::https://github.com/dawidm/cryptonose2/releases/download/v${pkgver}/cryptonose_${pkgver}-1_amd64.deb")
sha256sums=('a9aa3dee33e977c44c30c5d08197e156ed0f1871110d96934601c01dbe81e247')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"
  install -Dm644 "${pkgdir}/opt/cryptonose/share/doc/copyright" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/opt/cryptonose/lib/cryptonose-Cryptonose.desktop" \
   "${pkgdir}/usr/share/applications/cryptonose.desktop"
  install -Dm644 "${pkgdir}/opt/cryptonose/lib/Cryptonose.png" \
   "${pkgdir}/usr/share/pixmaps/cryptonose.png"
}
