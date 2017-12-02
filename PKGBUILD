# Maintainer: Phillip Schichtel <phillip.public@schich.tel>
pkgname=adapta-backgrounds
pkgver="0.5.0.1"
pkgrel=1
pkgdesc="Wallpaper collection for adapta-project"
arch=(any)
url="https://github.com/adapta-project/${pkgname}"
license=('GPL2' 'CCPL')
optdepends=('adapta-gtk-theme: The corresponding GTK theme')
makedepends=('glib2>=2.48.0'
             'libxml2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1d4af76ef58c3ad1aade3919001775bb932c1cb90989fd625fe8170ff08071ab')

build() {
    cd "${pkgname}-${pkgver}"
    ./autogen.sh
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

