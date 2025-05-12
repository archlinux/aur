# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple Common Lisp dependency manager."
arch=('x86_64')
url="https://github.com/fosskers/vend"
license=("MPL-2.0")
depends=('ecl')
makedepends=()
provides=()
options=('!strip')
source=("https://github.com/fosskers/vend/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c445e774acfe08f7f96191887ff3776216f1aea0156493a76dc01112c44c111a')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
