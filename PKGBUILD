# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=1.1.1
pkgrel=1
depends=('pam')
makedepends=('git' 'gcc')
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("tarball.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('915dc5acce413d5d32bb52c6f9980661a389a0939a49ac31bc250b2d162a5479')

build() {
    tar -xzf "tarball.tar.gz"
    cd "lidm-$pkgver"

    make CFLAGS="-O3"
}

package() {
    cd "lidm-$pkgver"
    make install DESTDIR="${pkgdir}"
}
