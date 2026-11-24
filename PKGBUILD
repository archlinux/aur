# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dopogoto-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Terminal music and video player with live chat"
arch=('x86_64')
url="https://github.com/dangerous-person/dopogoto-terminal-player"
license=('MIT')
depends=('alsa-lib' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/dangerous-person/dopogoto-terminal-player/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dopogoto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fe5d98ee5ead7753672a1ed4c6259f014bd7a083b1d6b57d0c61e4a60a02b971')
sha256sums_x86_64=('2b637fa92a8d1606309adbb7f977f1555426e612ceb6973b50d227867f9ed674')

package() {
  install -Dm755 "dopogoto" "${pkgdir}/usr/bin/dopogoto"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
