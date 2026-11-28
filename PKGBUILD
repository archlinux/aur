# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=containerd-shim-spin-bin
pkgver=0.27.2
pkgrel=1
pkgdesc="containerd shim for running Spin applications"
arch=('x86_64' 'aarch64')
url="https://github.com/spinframework/containerd-shim-spin"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/spinframework/containerd-shim-spin/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/containerd-shim-spin-v2-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/containerd-shim-spin-v2-linux-aarch64.tar.gz")
sha256sums=('f8e3418f698c578b0b21b0b1a109e792365d36a88780b215bf4370e8ec22b285')
sha256sums_x86_64=('b5f1418603852e886fcf2da3fff275afff9c7ea13dc07a61421d6e61c717306c')
sha256sums_aarch64=('64e15410280de889ca8e868b6956b81d94425aca191b6aeb4af9637596ec4776')

package() {
  install -Dm755 "containerd-shim-spin-v2" "${pkgdir}/usr/bin/containerd-shim-spin-v2"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
