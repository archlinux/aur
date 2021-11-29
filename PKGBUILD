# Maintainer: Tryton Van Meer <trytonvanmeer at protonmail dot com>

pkgname=dino-cli
pkgver=1.0.0
pkgrel=2
pkgdesc='A dinosaur on the CLI.'
arch=('x86_64')
url='https://github.com/tryton-vanmeer/dino-cli'
license=('GPL3')
makedepends=('dub' 'dmd')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/tryton-vanmeer/dino-cli/archive/v${pkgver}.tar.gz")
sha256sums=('a1ea4a48711c55ad62a5b6febd96b8028c1629606912dccef7423d24ad8dde9e')

build() {
    cd "$pkgname-$pkgver"
    dub build -b release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
