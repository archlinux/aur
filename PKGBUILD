# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
pkgname=lact-git
pkgver=r295.2108864
pkgrel=1
license=("MIT")
pkgdesc="AMDGPU Controller application (git version)"
url="https://github.com/ilya-zlobintsev/LACT"
makedepends=("rust" "git" "make" "clang")
depends=("gtk4" "hwdata")
arch=("x86_64" "aarch64")
backup=('etc/lact/config.yaml')
source=("git+https://github.com/ilya-zlobintsev/LACT.git")
sha512sums=("SKIP")
provides=('lact')

pkgver() {
  cd LACT
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd LACT
    make
}

package() {
    cd LACT
    DESTDIR=${pkgdir}/usr make install
}
