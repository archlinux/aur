pkgname=mate-indicator-applet
pkgver=1.14.1
pkgrel=1
pkgdesc="Applet to display information from various applications consistently in the MATE panel. (depends on ido-ubuntu which depends on gtk3-ubuntu)"
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/mate-indicator-applet"
license=('GPLv3')
makedepends=("intltool")
depends=("mate-panel-gtk3" "libappindicator3" "ido-ubuntu")
source=("https://github.com/mate-desktop/mate-indicator-applet/archive/v${pkgver}.tar.gz")
md5sums=('8bde2fd8c93b3b8d6a5964fd049a2949')

build() {
    cd ${pkgname}-${pkgver}
    autoreconf -fi
    ./configure --prefix=/usr --with-gtk=3.0
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
