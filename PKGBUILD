# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tomatui-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A terminal Pomodoro timer with a one-line mode, a full-screen display, and local focus statistics"
arch=('x86_64')
url="https://github.com/Hiro-Chiba/tomatui"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Hiro-Chiba/tomatui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tomatui-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('0a40b4c2cd3ffb7a03c37af716fe0caa6ddfe62ac07f3005f9c4443906ceb40c')
sha256sums_x86_64=('af750c9c41dfba8efca78fe65af347d139662203209a2b34d43f351b0ccd3c08')

package() {
  install -Dm755 "tomatui" "${pkgdir}/usr/bin/tomatui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
