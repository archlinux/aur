# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=0.0.1
pkgrel=4
depends=('pam')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("lidm::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make CFLAGS="-O3"
}

package() {
    cd "$pkgname"
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm755 themes/default.ini "${pkgdir}/etc/lidm.ini"
}
