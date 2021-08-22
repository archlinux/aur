# Maintainer: Randoragon <randoragongamedev@gmail.com>

pkgname=libstaple
pkgver=2.0.2
pkgrel=1
epoch=
pkgdesc="A general-purpose data structure library in pure C89"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/Randoragon/libstaple"
license=('LGPL2.1')
depends=()
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')
provides=()

build() {
    cd libstaple
    git checkout --quiet tags/v"${pkgver}"
    make
}

package() {
    cd libstaple
    git checkout --quiet tags/v"${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/license.txt"
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}
