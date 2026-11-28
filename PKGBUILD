# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tsuru-client-bin
pkgver=1.38.1
pkgrel=1
pkgdesc="Command-line client for the Tsuru PaaS"
arch=('x86_64' 'aarch64')
url="https://github.com/tsuru/tsuru-client"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tsuru/tsuru-client/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tsuru_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tsuru_${pkgver}_linux_arm64.tar.gz")
sha256sums=('047e4f042a8441f2b58bc4181a1d167bc462870f511b3b82f71d9ef3104c1a3e')
sha256sums_x86_64=('7d8ca839ba420a533b735750ac2b1ee534cfa10b632cb35c3dd3539ed0125dd6')
sha256sums_aarch64=('f0d419b42ee5e082b69e091ca82485d001d0d8611d5a5c3b2af21ad67350fed8')

package() {
  install -Dm755 "tsuru" "${pkgdir}/usr/bin/tsuru"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
