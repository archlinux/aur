# Maintainer: hendrik@hoodie.de
_pkgname=toastify
pkgname=${_pkgname}-git
pkgver=v0.3.0.r0.gdee957d
pkgrel=1
pkgdesc='Replacement for notify-send written in Rust.'
arch=('i686' 'x86_64')
url="https://github.com/hoodie/toastify"
license=('MIT/Apache-2.0')
depends=('libdbus')
makedepends=('rust' 'cargo')
source=("git+https://github.com/hoodie/toastify.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname/"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname/"
    cargo build --release
}

package() {
    install -Dm755  "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
