# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.1.5
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
sha256sums=('4e5aac9f486b8fe1d5b3223d71594c9eaa0f1da3164669f5e1f07bc03edb7d38')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
