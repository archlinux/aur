# Maintainer: Syycorax <syycorax@protonmail.ch>
pkgname="gofork"
pkgver="1.0"
pkgrel="1"
arch=("any")
pkgdesc="CLI tool to find forks that are ahead of a github repository."
arch=("x86_64")
depends=("git" "go")
license=("GPL-3.0")
source=("git+https://github.com/syycorax/gofork")
sha1sums=('SKIP')
build() {
    cd "$srcdir/$pkgname"
    go build -o gofork -ldflags "-w -s"
}
package() {
mkdir -p "$pkgdir/etc/$pkgname"
cd "$pkgname"
mkdir -p "$pkgdir/usr/bin"
install -Dm755 gofork "$pkgdir/usr/bin/gofork"
}
