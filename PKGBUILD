# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=cmix-git
pkgver=1.0
pkgrel=2
pkgdesc="lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
arch=('x86_64')
url="https://github.com/byronknoll/cmix"
license=('GPL-3.0-only')
depends=()
depends=('clang' 'make' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/cmix"
  make -j$(( $(nproc) + 1 ))
}

package() {
  cd "${srcdir}/cmix"
  install -D -m755 cmix "${pkgdir}/usr/bin/cmix"
}
