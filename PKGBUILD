# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=lexe-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Node.js-compatible runtime built on QuickJS"
arch=('x86_64' 'aarch64')
url="https://github.com/Ray-D-Song/lexe"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Ray-D-Song/lexe/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/lexe-linux-x64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/lexe-linux-arm64")
sha256sums=('58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd')
sha256sums_x86_64=('2b9ea2a52c47290c62cc7bb848ed6a9a9bd7a78e7899e79f91edcab95a24088b')
sha256sums_aarch64=('560361f526c51f67a375ddcb13e2850fee24412c4cde7445d07e84e0a3f275f0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/lexe"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
