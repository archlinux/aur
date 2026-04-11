# Maintainer: Harry Roberts <harryroberts306@gmail.com>
pkgname=deskedit-kernel++-beta
pkgver=0.2.1.fix
pkgrel=0
epoch=
pkgdesc="The beta release of Deskedit Kernel++, a remake of Deskedit Kernel that is still in early development. Currently it has no useful purpose."
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
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/harryr307/Kernel-Plus-Plus/-/archive/b${pkgver}/Kernel-Plus-Plus-b${pkgver}.zip")
noextract=()
sha256sums=('f69554b0049504381ed6cc9af35b87696f38bdd5e4d356e1ceb9eb820b81c59f')
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
  install -Dm0644 "$srcdir/Kernel-Plus-Plus-b$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}/"
  chmod +x "$pkgdir/usr/bin/kernel"
}
