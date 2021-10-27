# Maintainer: Federico Yulita <federico_yulita@hotmail.com>
pkgname="srt-edit"
pkgver=1
pkgrel=1
pkgdesc="A simple tool to edit .srt subtitles from the command line"
arch=("any")
url="https://github.com/fyulita/$pkgname"
license=("GPL3")
depends=("python>=3")
makedepends=("git")
source=("$pkgname::git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 srt_edit.py "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
