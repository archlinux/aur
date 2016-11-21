# Maintainer: Philipp Schmitt (philipp<at>schmitt<dot>co)

pkgname=gammu-json
pkgver=b61ff02
pkgrel=2
pkgdesc="A simple command-line utility to display received SMS messages as JSON, or delete messages, using libgammu."
arch=("any")
url="https://github.com/browndav/gammu-json"
license=("GPL3")
depends=("gammu")
source=("git+${url}#commit=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -d "$pkgdir/usr/bin"
    make PREFIX="$pkgdir/usr" install
}
