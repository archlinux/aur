# Maintainer: Chris Watson <cawatson1993@gmail.com>
pkgname=ztags-git
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="ctags support for zig, built with zig"
arch=('x86_64')
url="https://github.com/isaachier/ztags"
license=('Apache')
depends=()
makedepends=(zig-git)
provides=('ztags')
conflicts=('ztags')
source=("git://github.com/watzon/ztags.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$provides"
    zig build
}

package() {
    cd "$srcdir/$provides/zig-cache/bin"
    install -D ztags "$pkgdir/usr/bin/ztags"

    cd "$srcdir/$provides"
    install -D LICENSE "$pkgdir/usr/share/licenses/$provides/LICENSE"
}
