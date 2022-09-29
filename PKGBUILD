# Maintainer: z3oxs <z3ox1s@protonmail.com>
pkgname=rough
pkgver=1.0.7
pkgrel=1
pkgdesc="A GTK based app launcher written in Rust"
arch=(x86_64 i686)
url="https://github.com/z3oxs/rough.git"
license=('MIT')
depends=(gtk3)
makedepends=(git cargo)
provides=(rough)
conflicts=(rough)
source=("git+$url")
md5sums=('SKIP')
sha256sums=('SKIP')

build() {
    cd "$srcdir/rough"
    cargo build --release
}

package() {
    cd "$srcdir/rough"
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    cd "target/release"
    install -Dm755 rough "${pkgdir}/usr/bin/rough"
}
