# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=lean-community
pkgver=3.19.0
pkgrel=1
pkgdesc='Lean Theorem Prover, maintained by the Lean community'
arch=('x86_64' 'i386')
url="https://github.com/leanprover-community/lean"
license=('Apache')
makedepends=('cmake' 'ninja' 'python')
conflicts=('lean-bin' 'lean-git' 'lean3-bin' 'lean2-git')
source=("$pkgname-$pkgver::https://github.com/leanprover-community/lean/archive/v$pkgver.tar.gz")
sha256sums=(b99ad667a95418d680f378feb6c457d44f2327a933ee819e8315580528a758fe)

build() {
  cd "$pkgname"
  mkdir build
  cd build
  cmake ../src -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja
}

package() {
  cd "$pkgname"/build
  DESTDIR="$pkgdir" ninja install
}
