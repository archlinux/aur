# Maintainer: vaba <aur.demifusion@8shield.net>
pkgname=notepac
_gitname=notepac
pkgver=0.1.2
pkgrel=1
pkgdesc="Make notes about your installed packages"
url="https://gitlab.com/vaba/notepac"
license=("GPL3")
source=("git+$url#tag=v$pkgver")
md5sums=("SKIP")
arch=("x86_64")
makedepends=("git" "cargo")

build() {
    cd $_gitname
    cargo build --release
}

package() {
    cd $_gitname
    install -Dm755 --no-target-directory "src/args-collector.sh" "$pkgdir/usr/bin/${pkgname}" 
    install -Dm755 --target-directory="$pkgdir/usr/lib/${pkgname}" "target/release/note-manager"
}
