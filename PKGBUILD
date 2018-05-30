pkgname=pidgin-indicator
pkgver=1.0.1
pkgrel=1
pkgdesc="Pidgin plugin that adds tray icon using libappindicator"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pidgin-indicator"
license=('GPL')
depends=('pidgin' 'libappindicator-gtk2')
makedepends=('intltool')
install=pidgin-indicator.install
source=(https://github.com/philipl/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2 )
sha256sums=('753026b626a0ed896d1102acc4dc4565b022b99fa24f19d959d45318d5f83901')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
