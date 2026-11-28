# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tuiui-bin
pkgver=0.2.14
pkgrel=1
pkgdesc="Terminal window manager and desktop with floating windows, dock and launcher"
arch=('x86_64' 'aarch64')
url="https://github.com/jaylfc/tuiui"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/jaylfc/tuiui/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tuiui-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tuiui-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('cc280429fa624fcef1426c9f778c9ab2a87e5c7494a55371d687de3c66262e9f')
sha256sums_x86_64=('3f09374f8be1185349b68ac02e175027b12c70311cc91936f74deb27d0f897dd')
sha256sums_aarch64=('36fb2095141c343fdfd832b0e711dfb02683d0d6bc62ffc3152993449a9b3bde')

package() {
  install -Dm755 "tuiui" "${pkgdir}/usr/bin/tuiui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
