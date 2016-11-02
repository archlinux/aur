# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.3.0.1"
pkgrel=1
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
optdepends=('adapta-gtk-theme: The corresponding GTK theme')
makedepends=('glib2>=2.48.0'
             'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a5adb91c8ca9945baa9f206c83043d75931019b2a7510b72f77c455bb74e3b23')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

