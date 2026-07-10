# Maintainer: zedxihan <dev@gaffarmahmud.com>
pkgname=corganizer
pkgver=1.1.0
pkgrel=1
pkgdesc="A blazing fast, memory-safe CLI tool to automatically organize your cluttered files"
arch=('x86_64' 'aarch64')
url="https://github.com/zedxihan/corganizer"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('corganizer')
conflicts=('corganizer-git')
source=("https://github.com/zedxihan/corganizer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8acdf04062c6883cbd1d7dc90929250bdb3c840c1f80df96782f51ec0e36b4c')

build() {
  cd "${pkgname}-${pkgver}"
  make release
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
