# Maintainer: Hendrik Sollich <hendrik@hoodie.de>
_pkgname=asciii
pkgname=${_pkgname}-git
pkgver=v3.0.0 # auto
pkgrel=1
makedepends=('rust' 'cargo' 'cmake')
arch=('i686' 'x86_64')
source=("git+https://github.com/hoodie/asciii-rs.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/asciii-rs/"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    return 0
}

package() {
    cd "$srcdir/asciii-rs/"
    cargo install --root="$pkgdir"
}
