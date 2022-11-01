# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20220930
pkgrel=1
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap perl python numactl)
source=("https://github.com/linux-test-project/ltp/releases/download/${pkgver}/ltp-full-${pkgver}.tar.xz")
sha256sums=('533ab63915b916640667ecce17ee4998006d80d394d4b1f1d105a7aa1df50d38')
options=(!lto)

build() {
  cd "${srcdir}/ltp-full-${pkgver}"
  ./configure --prefix=/usr/share --mandir=/usr/share/man --with-bash 
  make
}

package() {
  cd "${srcdir}/ltp-full-${pkgver}"
  make DESTDIR="$pkgdir" install
}

