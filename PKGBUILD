# Maintainer: gilcu3

pkgname=cudnn8-cuda11.1
pkgver=8.0.5.39
_pkgver=8.0.5
_cudaver=11.1
_majorver=8
pkgrel=1
pkgdesc="NVIDIA CUDA Deep Neural Network library"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('custom')
conflicts=('cudnn')
depends=(cuda${_cudaver})
source=("https://developer.download.nvidia.com/compute/redist/cudnn/v${_pkgver}/cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz")
noextract=("cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz")

package() {
  mkdir -p "${pkgdir}"/usr/
  tar xf cudnn-${_cudaver}-linux-x64-v${pkgver}.tgz --strip-components 1 -C "${pkgdir}/usr"

  mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib
}
sha256sums=('1d046bfa79399dabcc6f6cb1507918754439442ea0ca9e0fbecdd446f9b00cce')
