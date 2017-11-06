# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=3.6.0
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2')
makedepends=('gnome-common' 'intltool')
replaces=('nemo-filename-repairer')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('593aaf206ef50a8185e1f71c9018ce6a8b4bcb82b4684494e069f9045ba11fd1')

build() {
    cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
    ./autogen.sh
    ./configure --prefix="/usr" --sysconfdir="/etc"
    make
}

package() {
    cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
