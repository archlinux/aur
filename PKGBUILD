# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-filename-repairer
pkgver=3.0.0
_mintrel=betsy
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo')
makedepends=('gnome-common')
install="${pkgname}.install"

source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('22d70ba4a39bcbf1efa0fa601faec68f38a0ae7a72da3f530fece31b8822183a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}+${_mintrel}"
    ./autogen.sh
    ./configure --prefix="/usr" --sysconfdir="/etc"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}+${_mintrel}"
    make DESTDIR="${pkgdir}" install
}
