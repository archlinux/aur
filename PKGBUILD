# Maintainer: seabassapologist <teamseabass@protonmail.com>
pkgname=untitled-spotifyd-controller
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple Go utility to display track information from, and send commands to, spotifyd from status bars and indicators"
arch=(x86_64)
url="https://github.com/seabassapologist/untitled-spotifyd-controller"
license=('BSD')
depends=('spotifyd')
makedepends=('go>=1.17')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d7fdf0eab49d27df55f87cdb372c4361a33510ae09eafac098b4d0117712aebf')
_shortname="spdcon"

build() {
    cd "$pkgname-$pkgver"
    go build -v -o $pkgname .
    ln -s $pkgname $_shortname
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    cp -a $_shortname "$pkgdir"/usr/bin/
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}
}
