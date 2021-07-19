# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

pkgname=modemu2k
pkgver=0.0.6
pkgrel=1
pkgdesc="adds telnet capability to a comm program"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="http://theimpossibleastronaut.com/modemu2k"
license=('GPL3')
makedepends=('flex')
optdepends=('gettext' 'minicom')

source=("https://github.com/theimpossibleastronaut/modemu2k/releases/download/v${pkgver}/modemu2k-${pkgver}.tar.gz")
sha256sums=('b09381628538996d4c22772f7955b42a63e482d1054508833524e36dbf27b7c2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
