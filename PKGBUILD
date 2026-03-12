pkgname=linux-wallpaper-engine-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Yet another linux wallpaper engine"
arch=("x86_64")
url="https://github.com/wqLouis/linux-wallpaperengine"
license=("GPL-3.0")
depends=()
makedepends=("git" "rustup")
provides=("linux-wallpaper-engine")
source=("${pkgname}::git+https://github.com/wqLouis/linux-wallpaperengine.git")
sha256sums=("SKIP")
options=(!strip)

prepare() {
    cd "$pkgname"

    rustup default stable
}

build() {
    cd "$srcdir/$pkgname"

    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm0755 "target/release/linux-wallpaper-engine" "${pkgdir}/usr/bin/linux-wallpaper-engine"
}
