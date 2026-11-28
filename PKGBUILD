# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=xrdebug-bin
pkgver=3.0.5
pkgrel=1
pkgdesc="Lightweight real-time debugger with a web interface"
arch=('x86_64' 'aarch64')
url="https://github.com/xrdebug/xrdebug"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/xrdebug/xrdebug/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/xrdebug-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/xrdebug-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('b2ee6252ddff584a738804f0a366a416d787432452d45e09afd117f77605ca42')
sha256sums_aarch64=('40f7c08bc0d9f82f6b8777e17668c156b9c73eb0e7105056bb142cf6201532a6')

package() {
  install -Dm755 "./xrdebug" "${pkgdir}/usr/bin/xrdebug"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
