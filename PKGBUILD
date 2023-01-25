# Maintainer: ngn13 <ngn13proton@proton.me>
pkgname="linux-video-viewer"
pkgver=1
pkgrel=2
pkgdesc="Opens any video as an MPV"
arch=("x86_64")
url="https://github.com/ByCh4n-Group/Linux-Video-Viewer"
license=("GPL3")
depends=("yad" "mpv")
makedepends=("git")
source=("${pkgname}::git+https://github.com/ByCh4n-Group/Linux-Video-Viewer.git")
sha256sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)"  "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 "Linux Video Viewer.sh" "$pkgdir/usr/bin/lvv"
}
