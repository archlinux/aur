# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spiceai-bin
pkgver=2.4.3
pkgrel=1
pkgdesc="Add a real-time analytics node to your operational database"
arch=('x86_64' 'aarch64')
url="https://github.com/spiceai/spiceai"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/spiceai/spiceai/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/spice_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/spice_linux_aarch64.tar.gz")
sha256sums=('84f1b133d14b3604a6d864653b12c4c7cc31bf2cbe96ad27cb6b05cd021dca4a')
sha256sums_x86_64=('53a032cc78d49225940f7cfca30cc66df745a5c698550581c3a7143e7f477772')
sha256sums_aarch64=('1a465e5e7b06862f70d897896e13cf539c87bf4132f1ac483999a07567b44698')

package() {
  install -Dm755 "spice" "${pkgdir}/usr/bin/spice"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
