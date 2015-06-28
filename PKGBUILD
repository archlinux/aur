# Maintainer: Silvio Knizek <killermoehre@gmx.net>

pkgname="xfce4-hotcorner-plugin"
pkgver=0.0.1
pkgrel=2
pkgdesc="Provides an easy way to set up hot corners in the Xfce desktop environment"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/brianhsu/xfce4-hotcorner-plugin"
groups=("xfce4")
depends=('xfce4-panel' 'libwnck')
makedepends=('cmake' 'xfce4-dev-tools' 'git')
install="${pkgname}.install"
source=("https://github.com/brianhsu/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('23cd5c29e5c6361407555509ff92e23794bd54a5ef7f1b9dafcd43a15235cb63')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
}

