# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=0.0.2
pkgrel=1
depends=('pam')
makedepends=('git' 'make' 'gcc')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("tarball.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('adf2d196969f6a2df8ceeb3564e1d51cc377f0deaeca31fee0bace58a3d2df2d')

build() {
    tar -xzf "tarball.tar.gz"
    cd "lidm-$pkgver"

    make CFLAGS="-O3"
}

package() {
    cd "lidm-$pkgver"

    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 themes/default.ini "${pkgdir}/etc/lidm.ini"
}
