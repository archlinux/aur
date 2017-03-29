pkgname=mate-indicator-applet
pkgver=1.18.0
pkgrel=2
pkgdesc="Applet to display information from various applications consistently in the MATE panel. (depends on ido-ubuntu which depends on gtk3-ubuntu)"
arch=('i686' 'x86_64')
url="https://github.com/mate-desktop/mate-indicator-applet"
license=('GPLv3')
makedepends=("intltool" "autoconf" "mate-common")
depends=("mate-panel" "libappindicator-gtk3")
source=("https://github.com/mate-desktop/mate-indicator-applet/archive/v${pkgver}.tar.gz")


build() {
    cd ${pkgname}-${pkgver}
    "$srcdir"/${pkgname}-${$pkgver}/autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}
md5sums=('1f78fe11afaf074be8378e222289046d')
