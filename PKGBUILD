# Maintainer: Harry Roberts <harryroberts306@gmail.com>
pkgname=deskedit-kernel++-beta
pkgver=0.2.1.fix
pkgrel=0
epoch=
pkgdesc="The beta release of Deskedit Kernel++"
arch=(x86_64)
url="https://github.com/DESKEDIT/Kernel-Plus-Plus.git"
license=('BSD-2-Clause')
groups=()
depends=(gcc-libs)
makedepends=(base-devel cmake git)
checkdepends=()
optdepends=()
provides=(kernel)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DESKEDIT/Kernel-Plus-Plus/archive/refs/tags/b${pkgver}.tar.gz")
noextract=()
sha256sums=('058f93ef3b82ee9e66914e3b501c8df0c3a61a04862ed3f689306490dc9aaddc')
validpgpkeys=()

build() {
  cd "$srcdir/Kernel-Plus-Plus-b$pkgver"
  cmake . -B ./build
  cmake --build ./build
}

package() {
  cd "$srcdir/Kernel-Plus-Plus-b$pkgver"
  echo $pkgdir
  install -Dm0644 -t "$pkgdir/usr/bin" "$srcdir/Kernel-Plus-Plus-b$pkgver/build/kernel"
  chmod +x "$pkgdir/usr/bin/kernel"
}
