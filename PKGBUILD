# Maintainer: Ilyess Bachiri <ae767c5e-13d3-460e-8b0e-03929616d9ad@anonaddy.me>
pkgname=otoclone
pkgver=0.4.1
pkgrel=1
pkgdesc="Automatic backup utility"
arch=("x86_64")
url="https://github.com/bilyes/otoclone"
license=('GPLv2')
depends=(rclone inotify-tools)
makedepends=(git go)
source=("git+$url")
md5sums=('SKIP')

build() {
    cd "$pkgname"
    go build -o "$pkgname"
}

package() {
    mkdir -p "$pkgdir"/usr/local/bin
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir"/usr/local/bin/"$pkgname"
}
