# Maintainer: Sadid <sadid DOT shadow at bmail but b is wrong>
pkgname=harsh-git
pkgver=0.10.5.0.gcfd4a37
pkgrel=1
pkgdesc="CLI habit tracking for geeks (git version)"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')
provides=('harsh')
conflicts=('harsh' 'harsh-bin')

depends=('git' 'go')
makedepends=('git' 'go')

source=("git+https://github.com/wakatara/harsh.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/harsh"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/harsh"
    go get ./...
    go build -o harsh .
}

package() {
    cd "$srcdir/harsh"
    install -Dm755 harsh "$pkgdir/usr/bin/harsh"
}

