# Maintainer: Curve <curve.platin at gmail.com>
pkgname=mergen
_pkgname=Mergen
pkgver=0.5.1
pkgrel=1
pkgdesc="Deobfuscation via optimization with usage of LLVM IR and parsing assembly"
arch=('any')
url="https://github.com/NaC-L/Mergen"
license=('GPLv3')
makedepends=('git' 'cmake' 'ninja' 'clang')
depends=('llvm')
conflicts=('mergen')
provides=('mergen')
source=("https://github.com/NaC-L/Mergen/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/$_pkgname-$pkgver"
  
  export CXX=/usr/bin/clang++
  cmake -G Ninja -B build && cmake --build build
}

package() {
  # install binary
  install -Dm 755 "${srcdir}/$_pkgname-$pkgver/build/lifter" "${pkgdir}/usr/bin/$pkgname"
}
