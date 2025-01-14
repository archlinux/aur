# Contributor: Colin Woodbury <colin@fosskers.ca>

pkgname=vend
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple Common Lisp gependency manager"
arch=('x86_64')
url="https://github.com/fosskers/vend"
license=("MPL-2.0")
depends=('ecl')
makedepends=()
provides=()
options=('!strip')
source=("https://github.com/fosskers/vend/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('36ca8cf9e64370d56f48304069ee5330793fc6dc22ddb213862dccdf929a86bf')

build() {
    cd vend-$pkgver
    ecl --load build.lisp
}

package() {
    cd vend-$pkgver
    install -Dm755 vend -t "$pkgdir/usr/bin"
}
