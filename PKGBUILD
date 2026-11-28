# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=componentize-py-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Build WebAssembly components from Python"
arch=('x86_64' 'aarch64')
url="https://github.com/bytecodealliance/componentize-py"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/bytecodealliance/componentize-py/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/componentize-py-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/componentize-py-v${pkgver}-linux-aarch64.tar.gz")
sha256sums=('53b9cd9e8a1b8c1db8ef188751263b20ca20ac8e4bef558a7fb6167afaa53a08')
sha256sums_x86_64=('4c799e8f53101c58c57f696039d52e454ba95cd68e7f5eb4a746dca9017fb15b')
sha256sums_aarch64=('f6feee59d4cf4dd46ad019ad95226200882ee0689774a52eaf0df8783695141b')

package() {
  install -Dm755 "componentize-py" "${pkgdir}/usr/bin/componentize-py"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
