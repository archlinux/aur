# Maintainer: Sebastian Schrader <sebastian.schrader@ossmail.de>
pkgname=pyconfigure
pkgver=0.2.3
pkgrel=1
pkgdesc="Build autotools/autoconf configure scripts for Python packages"
arch=('any')
url='https://www.gnu.org/software/pyconfigure/'
license=(GPL3)
depends=('autoconf' 'python')
makedepends=()
source=("https://ftp.gnu.org/gnu/pyconfigure/$pkgname-$pkgver.tar.gz")
sha256sums=('37438ee1ae0aad7692188c7d01218cb407a1c89f3efdb5d360311b7ade4ab14f')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
