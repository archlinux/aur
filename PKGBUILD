# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=dotsync
pkgver=1.0.0
pkgrel=1
pkgdesc="Sync dotfiles with your Git repository"
arch=("x86_64")
url="https://github.com/mortymacs/dotsync"
license=("GPL-3")
makedepends=("gcc" "cmake" "make")
depends=("yaml-cpp" "libgit2" "fmt")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05ef06ce2ef607c1648dd47215b07a4f8afe338e92943a086939325254ff2226')

build() {
  cd "$pkgname-$pkgver"
  cmake .
  make -j"$(nproc)"
}

package() {
  install -Dm755 "${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
}

