# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=linux-test-project
pkgver=20210121
pkgrel=1
pkgdesc="Collection of tools for testing the Linux kernel and related features"
arch=(i686 x86_64)
license=(GPL2)
url="https://linux-test-project.github.io/"
depends=(acl bash gawk libcap libtirpc python numactl)
source=("https://github.com/linux-test-project/ltp/releases/download/${pkgver}/ltp-full-${pkgver}.tar.xz")
sha256sums=('72b0a063f0d48efaaa93ed403d56662ac2b1dd3f74ecb5c6e5b3900791fa6c29')

build() {
  cd "${srcdir}/ltp-full-${pkgver}"
  ./configure --prefix=/usr/share --mandir=/usr/share/man --with-bash 
  make
}

package() {
  cd "${srcdir}/ltp-full-${pkgver}"
  make DESTDIR="$pkgdir" install
}

