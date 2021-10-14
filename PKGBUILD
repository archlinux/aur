#  Maintainer: jzbor <zborof@posteo.de>

pkgname='buttermilk'
pkgver=0.1.1
pkgrel=1
pkgdesc='A basic personal terminal emulator based on VTE'
arch=('x86_64')
url='https://github.com/jzbor/buttermilk'
license=('MIT')
depends=('vte3'
         'libinih')
makedepends=()
optdepends=()
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
noextract=()
sha256sums=('120e69885ae5f00260777a335dfaaea025f6a572e739b2971970c00c42400780')
validpgpkeys=()

build () {
	cd "$pkgname-$pkgver"
    make all
}

package () {
	cd "$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/buttermilk/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/buttermilk/README.md"
}

