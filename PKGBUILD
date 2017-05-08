# Maintainer: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=3.4.0
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
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2')

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
