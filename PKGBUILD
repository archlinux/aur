# Maintainer: Sinan Tan <i@tinytangent.com>
# Contributor: Jingbei Li <i@jingbei.li>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Adria Arrufat <adria.arrufat AT protonmail+aur DOT com>
# Contributor: Sami B. <spidermario@free.fr>
# Contributor: Yunhui Fu <yhfdev@gmail.com>
pkgname=cudnn7.0-cuda9.0
pkgver=7.0.5
pkgrel=2
_cudaver=9.0
pkgdesc="NVIDIA CUDA Deep Neural Network library (version 7.0)"
arch=('x86_64')
url="https://developer.nvidia.com/cuDNN"
license=('proprietary')
depends=('cuda-9.0')
provides=('cudnn7.0')
conflicts=('cudnn7.0')
source=("http://developer.download.nvidia.com/compute/redist/cudnn/v${pkgver}/cudnn-${_cudaver}-linux-x64-v7.tgz")
sha512sums=('63752fe8991b750794bd41d720d1ab2c94584fd9a0e297c68549d8e44cf2742f0601021ae54f5227e4865869fddb5d5b2f7445bfda2c0808b8973345337a907e')

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/etc"

  cp -r cuda "${pkgdir}/opt/cudnn7.0"

  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/opt/cudnn7.0/lib64/" > ${pkgdir}/etc/ld.so.conf.d/cudnn7.0.conf
}
