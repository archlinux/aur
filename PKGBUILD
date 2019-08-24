# Maintainer: Vasanth Developer <vasanth@vasanthdeveloper.com>
pkgname=samaya-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A time synchronization program that uses HTTP protocol"
url="https://github.com/vasanthdeveloper/samaya"
license=('GPL')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vasanthdeveloper/samaya/archive/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vasanthdeveloper/samaya/archive/mainline.zip")

# Uncomment this line when downloading a package from local server for testing purposes
# source=("${pkgname}-${pkgver}.tar.gz::http://localhost:8080/archive.tar.gz")

depends=('systemd')
arch=(
    'i686'
    'x86_64'
)
makedepends=(
    'go'
    'make'
)
build() {
    cd "$srcdir/samaya-mainline"
    make
}
package() {
    cd "$srcdir/samaya-mainline"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
md5sums=('4bd7eb42a9504cd5874e30d4c2d5ebdf')
