#  Maintainer: jzbor <zborof@posteo.de>

pkgname=buttermilk
pkgver=0.2.0
pkgrel=1
pkgdesc='A basic personal terminal emulator based on VTE'
arch=('x86_64' 'aarch64')
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
sha512sums=('4c29abe620cbf4e466ff46cfaba09c1411244d9eb3e057ff732137716f3a02580bf9285e82d2614d61973f3beac4108c68cc9cca2cae662aa8d553961427c8a1')
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

