# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=zopflipng-git
pkgver=1.0.0.r31.g6ff3ba2
pkgrel=1
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
    git describe | sed -r 's/zopfli-//; s/([^-]*-g)/r\1/; s/-/./g'
}

build() {
    cd "$srcdir/zopfli"
    make zopflipng
}

package() {
    cd "$srcdir/zopfli"
    install -Dm755 zopflipng "${pkgdir}/usr/bin/zopflipng"
}
