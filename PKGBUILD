pkgname=mindfuck-compiler
pkgver=0.0.1
pkgrel=1
pkgdesc="A compiler for the MindFuck programming language!"
arch=('x86_64')
url="https://autizm.us"
license=('MIT')
depends=('nasm' 'binutils')
makedepends=('rust' 'cargo')
source=("https://github.com/Polokalap/mindfuck-compiler/archive/refs/heads/main.zip")
sha256sums=('8bc4b26b9347317fd1df80734b38fce0636d4a5f13dba8a115aeb51a08065ed3')

build() {

    cd "$srcdir/mindfuck-compiler-main"
    cargo build --release

}

package() {

    cd "$srcdir/mindfuck-compiler-main"
    install -Dm755 "target/release/mfc" "$pkgdir/usr/bin/mfc"

}
