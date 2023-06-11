# Maintainer: Rick Stanley <rick {hyphen} stanley {at} outlook[dot] com>

pkgname=webgpu-headers-git
pkgver=r118.64aeb86
pkgrel=1
pkgdesc="WebGPU native header files"
arch=(any)
url="https://github.com/webgpu-native/webgpu-headers/"
license=(BSD)
makedepends=(git)
provides=()
conflicts=()
source=("git+https://github.com/webgpu-native/webgpu-headers.git")
sha256sums=('SKIP')

pkgver() {
  cd webgpu-headers
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd webgpu-headers
  install -D webgpu.h -t "${pkgdir}/usr/include/webgpu"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

