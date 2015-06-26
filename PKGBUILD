# Maintainer: Silvio Knizek <killermoehre@gmx.net>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.1
pkgrel=1
pkgdesc="Provides an easy way to set up hot corners in the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/brianhsu/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
install="${pkgname}.install"
source=("https://github.com/brianhsu/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4cc7e8598fb2b80a5280e0561cf116c3610c1b6e5521d429965d58e75ddf38f1')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

