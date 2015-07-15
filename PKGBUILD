pkgname="footswitch-git"
pkgver=11.f2bfaa2
pkgrel=1
pkgdesc="Command-line utility for PCsensor foot switch"
url="https://github.com/rgerganov/footswitch"
arch=('any')
license=('GPL')
makedepends=()
source=(git+https://github.com/rgerganov/footswitch)
md5sums=(SKIP)

pkgver() {
    cd "footswitch"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd "footswitch"

    make
}

package() {
    install -D "$srcdir/footswitch/footswitch" "$pkgdir/usr/bin/footswitch"
}
