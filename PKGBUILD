# Maintainer: Silvio Knizek <killermoehre@gmx.net>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.2
pkgrel=2
pkgdesc="Provides an easy way to set up hot corners in the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/brianhsu/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck3')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
install="${pkgname}.install"
source=("https://github.com/brianhsu/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('942684c92f96a158e1417e597947f822769ac56aa1993a8c9f166ee633ef2b8d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

