#  Maintainer: jzbor <zborof@posteo.de>

pkgname='buttermilk'
pkgver=0.1.0
pkgrel=1
pkgdesc='A basic personal terminal emulator based on VTE'
arch=('x86_64')
url='https://github.com/jzbor/buttermilk'
depends=('vte3'
         'libinih')
makedepends=()
optdepends=()
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build () {
	cd "$pkgname-$pkgver"
    make all
}

package () {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
}

