# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20230127
pkgrel=1
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap perl python numactl)
source=("https://github.com/linux-test-project/ltp/releases/download/${pkgver}/ltp-full-${pkgver}.tar.xz")
sha256sums=('254412a52c7238f35a247337da186f485e76fb64c6549ed849b3442fc7a417ef')
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

