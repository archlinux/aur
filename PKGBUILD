# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=3.2.0
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2')
makedepends=('gnome-common')
replaces=('nemo-filename-repairer')
install="${pkgname}.install"

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('1536fd828b2ee0a8f194155a9e13b8cce937b403b5c87d8e579d7b1ced8d6d14')

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
