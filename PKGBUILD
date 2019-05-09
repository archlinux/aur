pkgname=enroot-git
pkgver=1.0.0
pkgrel=2
pkgdesc='A simple yet powerful tool to turn traditional container/OS images into unprivileged sandboxes.'
url='https://github.com/NVIDIA/enroot'
arch=(x86_64)
license=(BSD)
makedepends=(git gcc make libcap libtool)
depends=(bash coreutils curl gawk jq parallel shadow squashfs-tools grep findutils gzip glibc sed tar util-linux)
optdepends=(pv pigz ncurses libnvidia-container-tools squashfuse fuse-overlayfs)
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
