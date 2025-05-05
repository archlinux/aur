# Maintainer: bash000000 <hidden>

pkgname=cudss
pkgver=0.5.0.16
_cudaver=12
pkgrel=1
pkgdesc="NVIDIA GPU-accelerated Direct Sparse Solver library"
arch=('x86_64')
url="https://developer.nvidia.com/cudss"
license=("custom")
#license https://docs.nvidia.com/cuda/cudss/license.html
depends=('cuda>='"${_cudaver}")
options=(!strip staticlibs)
source=("https://developer.download.nvidia.com/compute/cudss/redist/libcudss/linux-x86_64/libcudss-linux-x86_64-${pkgver}_cuda${_cudaver}-archive.tar.xz")
b2sums=('ea0146a65f2f614083f96d0f361c299affad2f798505a41cde36d0bcae6ca30b61f2107fc098c78acbb8ad440433cd580912da62ee125dda88da8fc5e53aec21')
package() {
  cd libcudss-linux-x86_64-${pkgver}_cuda${_cudaver}-archive

  mkdir -p "$pkgdir"/opt/cuda/targets/x86_64-linux
  cp -r lib include "$pkgdir"/opt/cuda/targets/x86_64-linux
  cp -r src "$pkgdir"/opt/cuda/
  install -Dm644 LICENSE "${pkgdir}"/opt/cuda/usr/share/licenses/${pkgname}/LICENSE
}

