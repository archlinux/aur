# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=1.2.3
pkgrel=3
depends=('pam')
makedepends=()
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ce414b510c5bbc3e32ea882f915b4d3958cb82eb1fbb5cf33e62f69c844bf93')

build() {
    make -C "$srcdir/lidm-$pkgver"
}

package() {
    make -C "$srcdir/lidm-$pkgver" DESTDIR="$pkgdir" install
}
