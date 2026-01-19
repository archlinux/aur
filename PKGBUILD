# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.3.2
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
sha256sums=('a6ec2198b8375d08fb0b96e2428b9044e5050316079a49f06621b3855707f2f2')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
