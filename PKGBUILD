# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=zopflipng-git
pkgver=6ff3ba2
pkgrel=2
pkgdesc="PNG optimisation tool using Google's zopfli library, git version."
arch=('i686' 'x86_64' 'ARM')
url="https://github.com/google/zopfli"
license=('Apache')
makedepends=('git')
depends=('gcc-libs')
provides=('zopflipng')
source=('git+https://github.com/google/zopfli.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/zopfli"
    printf "%s" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/zopfli"
    make zopflipng
}

package() {
    cd "$srcdir/zopfli"
    install -Dm755 zopflipng "${pkgdir}/usr/bin/zopflipng"
}
