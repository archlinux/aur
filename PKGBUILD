# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=phanalist-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Fast static analyzer for PHP"
arch=('x86_64')
url="https://github.com/denzyldick/phanalist"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/denzyldick/phanalist/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/phanalist-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('c15554520c83e43cc1d8040ac822bfa1fe45f9461cc6770297c63f9836e4c02b')
sha256sums_x86_64=('debbf9f9ee871b421e6d4fe66d16a9e5d8039ebbf3d48005a6199933380acb6a')

package() {
  install -Dm755 "phanalist" "${pkgdir}/usr/bin/phanalist"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
