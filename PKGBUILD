# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.1.2
pkgrel=2
pkgdesc="Simple Common Lisp dependency manager"
arch=('x86_64')
url="https://github.com/fosskers/vend"
license=("MPL-2.0")
depends=('ecl')
makedepends=()
provides=()
options=('!strip')
source=("https://github.com/fosskers/vend/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f5d0f81480485567c0e4e5a13f9d0d509435898421a1b4018c5519e730e2dc55')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
