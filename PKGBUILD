# Maintainer: Siddhant Madhur <siddhant.madhur@gmail.com>
pkgname=straw
pkgver=v2.1.alpha
pkgrel=1
pkgdesc="CLI tool to easily go-to projects all over your desktop and open a new tmux session in it"
arch=(x86_64)
url="https://github.com/siddhantmadhur/straw"
license=(MIT)
makedepends=(git cargo)
depends=(tmux)
provides=(straw)
source=("straw::git+https://github.com/siddhantmadhur/straw.git")
sha256sums=(SKIP)

pkgver () {
    cd straw
    git describe --tags --abbrev=0
}


build() {
    cd straw
    cargo build --release 
}

package() {
    cd straw
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
