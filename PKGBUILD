# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=boon-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="JSON Schema validator supporting drafts 4 through 2020-12"
arch=('x86_64' 'aarch64')
url="https://github.com/santhosh-tekuri/boon"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/santhosh-tekuri/boon/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/boon-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/boon-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594')
sha256sums_x86_64=('18418f8cab8c7089d96568be79e1c0553494881e1a4620f4929f2eb55eec9f56')
sha256sums_aarch64=('4f54fb7e7eeedb03b12cfd1ad9bbba1f95581365060681166c029709368debaa')

package() {
  install -Dm755 "boon" "${pkgdir}/usr/bin/boon"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
