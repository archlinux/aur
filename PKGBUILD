# Maintainer: headset <headset@devheadset.org>

pkgname='xclock-git'
pkgver=0.4
pkgrel=1
pkgdesc='simple tui clock'
arch=("any")
url='https://github.com/devHeadset/xClock'
license=('GPL')
makedepends=('cargo' 'git')
source=("git+$url.git")
md5sums=('SKIP')

_binname=xClock

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"

    install -Dm755 "./target/release/$_binname" "$pkgdir/usr/bin/$_binname"
}

