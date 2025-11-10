# Maintainer: alcubierre-drive

pkgname=uni2ascii-git
pkgver=4.20.r0.gfaa5651
pkgrel=2
pkgdesc="Provides conversion in both directions between UTF-8 and many 7-bit ASCII equivalents"
license=('GPL3')
depends=('gcc')
arch=('any')
url="https://github.com/alcubierre-drive/uni2ascii"
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=( 'SKIP' )
backup=()

build() {
    cd "${srcdir}/${pkgname}"
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir" install
}
