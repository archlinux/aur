# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.1.3
pkgrel=1
pkgdesc="Simple Common Lisp dependency manager"
arch=('x86_64')
url="https://github.com/fosskers/vend"
license=("MPL-2.0")
depends=('ecl')
makedepends=()
provides=()
options=('!strip')
source=("https://github.com/fosskers/vend/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b21177b7cd86ee0a219fea60745111671e63e5dcfcc668137746de8a610bbd20')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
