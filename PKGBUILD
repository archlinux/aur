# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=4.4.0
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
sha256sums=('97b4f8614ec403fa550cc9af7adf6518cd11fd8377cb535f3eecb88239588dd7')

build() {
    cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
    ./autogen.sh --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}
