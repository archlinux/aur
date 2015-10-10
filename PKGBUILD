# Maintainer: moebiuseye <möëbïüs döt ëÿë ät gmäïl döt cöm>

pkgname="skf-framework"
pkgver=89.43094a3
pkgrel=1
arch=(any)
pkgdesc="Plugin-based static website generator inspired by Suckless Web Framework"
url="http://skf.jeannedhack.org/"
license=(GPLv3)
depends=("markdown" "bash>4")
makedepends=("make" "git")
optdepends=("rsync")
provides=("skf-framework")
conflicts=("skf-framework")
source=("git://github.com/moebiuseye/skf.git")
md5sums=("SKIP")

_gitroot=skf

pkgver () {
    cd "$srcdir/$_gitroot"
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitroot"
    echo " DSTDIR = $pkgdir "
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
