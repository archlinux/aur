# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.2.1
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
sha256sums=('70173d2c4e97b623055f022a9f469f8f16213a54003918ab82525f82bb59e445')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
