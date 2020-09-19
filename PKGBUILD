#Maintainer: Karl Wikström <boogrocha@sidus.io>
#Maintainer: William Leven <boogrocha@sidus.io>

tag=v1.0.19
pkgname=boogrocha
pkgver=$tag
pkgrel=1
pkgdesc="A lightweight, easy to use command-line application (bgc) for managing your group room bookings at Chalmers University of Technology"
arch=('x86_64')
conflicts=(bgc)
provides=(bgc)
url="https://github.com/sidusio/boogrocha"
license=("GPL3")
makedepends=(go)
source=($url/archive/$tag.tar.gz)
sha256sums=('d435c1c1ced813c392e33e0bac0fbdbd415f67dcebc0a165c9456ae2313c23f0')

build() {
    go build ./$pkgname/cmd/bgc
}

package() {
    install -Dm755 ./$pkgname/bgc "$pkgdir"/usr/bin/bgc
}
