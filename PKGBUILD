# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-git
pkgver=1.2.3.r3.g363deea
pkgrel=3
depends=('pam')
makedepends=('git')
pkgdesc="A fully colorful customizable TUI display manager made in C. (last git commit)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm')
source=("lidm::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/lidm"
    git describe --long --abbrev=7 --tags | \
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/lidm"
    make
}

package() {
    cd "$srcdir/lidm"
    make DESTDIR="${pkgdir}" install
}
