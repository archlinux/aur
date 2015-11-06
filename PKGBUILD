pkgname=pidgin-indicator
pkgver=0.9
pkgrel=3
pkgdesc="Pidgin plugin that adds tray icon using libappindicator"
arch=('i686' 'x86_64')
url="https://github.com/philipl/pidgin-indicator"
license=('GPL')
depends=('pidgin' 'libappindicator-gtk2')
makedepends=('intltool')
install=pidgin-indicator.install
source=(https://github.com/philipl/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.bz2 )
sha256sums=('a604f7a5bc96306df2bc1977ee5a49e648a364294ffc7c44f64c00cf4ccee8c3')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
