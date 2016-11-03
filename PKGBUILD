# Maintainer: Hendrik Sollich <hendrik@hoodie.de>
_pkgname=asciii
pkgname=${_pkgname}-git
pkgver=v3.0.0.beta1.r47.gf78ebfe # auto
pkgrel=2
#makedepends=('rust' 'cargo' 'cmake')
arch=('i686' 'x86_64')
source=("git+https://github.com/hoodie/asciii-rs.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/asciii-rs/"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/asciii-rs/"
    cargo build --release
}

package() {
    cd "$srcdir/asciii-rs/"
    install -Dm755  "$srcdir/asciii-rs/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
