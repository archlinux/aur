#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

pkgname=boogrocha
pkgver=v1.0.5
pkgrel=1
pkgdesc="A lightweight, easy to use command-line application (bgc) for managing your group room bookings at Chalmers University of Technology"
arch=('x86_64')
conflicts=(bgc)
provides=(bgc)
url="https://github.com/sidusio/boogrocha"
license=("GPL3")
makedepends=(git go)
source=($pkgname::git+$url.git#tag=v1.0.5)
sha256sums=('SKIP')

build() {
    cd $pkgname/cmd/bgc
    go build
}

package() {
    cd $pkgname/cmd/bgc
    install -Dm755 bgc "$pkgdir"/usr/bin/bgc
}
