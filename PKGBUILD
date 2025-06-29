# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=1.1.0
pkgrel=1
depends=('pam')
makedepends=('git' 'gcc')
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("tarball.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4c39eb29f8a8b705b7a40f71df9b0ee2c8c140da039f933b2b895e649aaa8068')

build() {
    tar -xzf "tarball.tar.gz"
    cd "lidm-$pkgver"

    make CFLAGS="-O3"
}

package() {
    cd "lidm-$pkgver"
    make install DESTDIR="${pkgdir}"
}
