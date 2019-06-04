pkgname=enroot-git
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple yet powerful tool to turn traditional container/OS images into unprivileged sandboxes.'
url='https://github.com/NVIDIA/enroot'
arch=(x86_64)
license=(BSD)
makedepends=(git gcc make libtool)
depends=(jq parallel squashfs-tools)
optdepends=(fuse-overlayfs-git libnvidia-container-tools pigz pv squashfuse)
source=("git+https://github.com/NVIDIA/enroot.git#tag=v${pkgver}")
sha256sums=(SKIP)
install="${pkgname}.install"

build() {
  cd 'enroot'
  make prefix='' exec_prefix=/usr
}

package() {
  cd 'enroot'
  DESTDIR="$pkgdir/" make install prefix='' exec_prefix=/usr
}
