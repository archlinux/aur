# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=pidgin-window-merge
pkgver=0.3
pkgrel=1
_githash=b4811ae1807a6c124fb06a717951bb2541be19f7
pkgdesc="A Pidgin plugin that merges the Buddy List window with a conversation window"
arch=('any')
url="https://github.com/dm0-/window_merge"
license=('GPL')
depends=('pidgin')
source=("window_merge-0.0.tar.gz::$url/tarball/$_githash")  # No tag available on github
sha256sums=('508d15302123e852337cdd03f82b021b9f6e2754e77be4c9581736ba1e41a186')

build() {
    cd dm0--window_merge-b4811ae
    mkdir -p m4
    autoreconf -fi
    ./configure --prefix=/usr
    make distdir
}

package() {
    cd dm0--window_merge-b4811ae
    make DESTDIR="$pkgdir" install
}
