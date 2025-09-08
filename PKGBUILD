# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.3.1
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
sha256sums=('6bde05d7ba312cfb2e2c7f862e2128089dda476649d930f57c8f60238c0a48aa')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
