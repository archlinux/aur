# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=0.2.2
pkgrel=1
depends=('pam')
makedepends=('git' 'gcc')
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("tarball.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25523abc3ce6f2f261bff0cc52663607fe114692d6d3736f27fd843cae3f3a27')

build() {
    tar -xzf "tarball.tar.gz"
    cd "lidm-$pkgver"

    make CFLAGS="-O3"
}

package() {
    cd "lidm-$pkgver"
    make install DESTDIR="${pkgdir}"
}
