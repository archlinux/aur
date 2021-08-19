# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=librnd
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="General-purpose data structure library in pure C89"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/Randoragon/librnd"
license=('GPL2')
depends=()
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
provides=()

build() {
    cd librnd
    git checkout --quiet tags/v"${pkgver}"
    make
}

package() {
    cd librnd
    git checkout --quiet tags/v"${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}
