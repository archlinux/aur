# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=easegress-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="A Cloud Native traffic orchestration system"
arch=('x86_64' 'aarch64')
url="https://github.com/easegress-io/easegress"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/easegress-io/easegress/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/easegress-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/easegress-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('37691d091672fd7afade6b5b52e4fa5c24bfa8128e1333f3b7d7d32b7f45ab53')
sha256sums_aarch64=('c9c80f668b9ce331b43d87751587b4eae2051267d86121436821bc40bba4ff6d')

package() {
  install -Dm755 "bin/egctl" "${pkgdir}/usr/bin/egctl"
  install -Dm755 "bin/egbuilder" "${pkgdir}/usr/bin/egbuilder"
  install -Dm755 "bin/easegress-server" "${pkgdir}/usr/bin/easegress-server"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
