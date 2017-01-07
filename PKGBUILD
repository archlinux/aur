pkgname=pidgin-indicator
pkgver=1.0
pkgrel=1
pkgdesc="Pidgin plugin that adds tray icon using libappindicator"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pidgin-indicator"
license=('GPL')
depends=('pidgin' 'libappindicator-gtk2')
makedepends=('intltool')
install=pidgin-indicator.install
source=(https://github.com/philipl/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2 )
sha256sums=('009a01f571855f82f16f0753b104d6afa694452b3c2b176f57553e16155d25b7')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
