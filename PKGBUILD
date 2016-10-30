# Maintainer: Jonathan <greenbigfrog@gmail.com>
_pkgname=okcash
pkgname=okcashd
pkgver=4.0.0.3
pkgcodename=Utopia
pkgrel=1
pkgdesc="Okcash daemon"
arch=('i686' 'x86_64')
url="http://okcash.co"
license=('MIT')
makedepends=('git' 'boost')
depends=('boost-libs' 'openssl')
provides=('okcashd')
conflicts=('okcashd')
source=("https://github.com/okcashpro/okcash/archive/v$pkgver-core.$pkgcodename.zip")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}-$pkgver-core.$pkgcodename/src"
    make -f makefile.unix USE_UPNP=-
}

package() {
    cd "${srcdir}/${_pkgname}-$pkgver-core.$pkgcodename/"
    install -Dm755 "src/okcashd" "${pkgdir}/usr/bin/okcashd"
    install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/okcashd/LICENSE"
    install -d "${pkgdir}/usr/share/doc/okcashd"
    cp -a "doc/" "${pkgdir}/usr/share/doc/okcashd/"
}
