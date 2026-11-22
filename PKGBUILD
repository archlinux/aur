# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ratifact-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="Track and manage build artifacts from multiple programming languages"
arch=('x86_64' 'aarch64')
url="https://github.com/adolfousier/ratifact"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/adolfousier/ratifact/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ratifact-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ratifact-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('0b5d652f1859f0f11971ad6e3dfc1f0856948fbbba253b1eb85bb1e512cc44e1')
sha256sums_x86_64=('abfc0844592cb5f557ece62ce06e7ef3e747603d9e8f5dcdc0b67bbdf22097de')
sha256sums_aarch64=('09517d5db484edbcf209e9734aaf4cb27e1f601982dc6cb35f4d42b053c32615')

package() {
  install -Dm755 "ratifact" "${pkgdir}/usr/bin/ratifact"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
