# Maintainer: whriedplanck
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx5-sayura-git
pkgver=r64.8a574b6
pkgrel=1
pkgdesc="A Sinhala input method for Fcitx input method framework ported from IBus-Sayura"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5-sayura"
license=('GPL')
depends=('boost-libs' 'curl' 'fcitx5-git' 'opencc')
makedepends=('clang' 'cmake' 'git' 'extra-cmake-modules')
replaces=('fcitx-sayura')
conflicts=('fcitx-sayura')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd fcitx5-sayura
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd fcitx5-sayura
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd fcitx5-sayura
    cd build
    make DESTDIR="$pkgdir" install
}
