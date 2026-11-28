# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=zerobox-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Lightweight process sandboxing based on the Codex runtime"
arch=('x86_64' 'aarch64')
url="https://github.com/afshinm/zerobox"
license=('Apache-2.0')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/afshinm/zerobox/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/zerobox-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/zerobox-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('4cd77b406f2605fc01886c5e232a2c25fdf70fc2dcb6d441140a3dc9b94f754c')
sha256sums_x86_64=('a00528269321d30e011f4b61c9b9b210f01b70033102bd24892b194eab47f286')
sha256sums_aarch64=('7b840b4d562f51386368b4cdcaed34731012677872fa698dfbe5ea529ba683db')

package() {
  install -Dm755 "zerobox" "${pkgdir}/usr/bin/zerobox"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
