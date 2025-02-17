# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=clfmt
pkgver=0.1.0
pkgrel=1
pkgdesc="Formatter for Common Lisp."
arch=('x86_64')
url="https://github.com/fosskers/clfmt"
license=("MPL-2.0")
depends=('ecl')
makedepends=()
provides=()
options=('!strip')
source=("https://github.com/fosskers/clfmt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8566ea63780f85585c8a051f1fbeda15acfaddc3416f7576bc6ca11603e748fc')

build() {
    cd clfmt-$pkgver
    ecl --load build.lisp
}

package() {
    cd clfmt-$pkgver
    install -Dm755 clfmt -t "$pkgdir/usr/bin"
}
