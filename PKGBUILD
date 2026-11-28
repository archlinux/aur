# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=amp-acp-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="ACP adapter for Amp Code"
arch=('x86_64' 'aarch64')
url="https://github.com/tao12345666333/amp-acp"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tao12345666333/amp-acp/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/amp-acp-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/amp-acp-linux-aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('205c819383b6fd389b408120ebea9cdde5c2957530b5ce4ebc912998d4118f8b')
sha256sums_aarch64=('ad7e1c23ec29bf47f757d656fc4c9a957dd60533da034213a6bc7d33d1813d32')

package() {
  install -Dm755 "amp-acp" "${pkgdir}/usr/bin/amp-acp"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
