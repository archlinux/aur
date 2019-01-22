# Maintainer: kuviman <kuviman@gmail.com>
pkgname=glitchcat-git
pkgver=0.3.2
pkgrel=1
depends=()
makedepends=('rust')
arch=('x86_64')
pkgdesc="A cat-like program with glitch animation"
source=("git+https://github.com/kuviman/glitchcat")
md5sums=('SKIP')
url="https://github.com/kuviman/glitchcat"
license=('MIT')

build() {
    cd "$srcdir/glitchcat"
    cargo build --release
}

package() {
    cd "$srcdir/glitchcat"
    install -Dm755 "target/release/glitchcat" "$pkgdir/usr/bin/glitchcat"
}
