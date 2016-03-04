# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-image-converter
pkgver=2.8.0
_mintrel=rosa
pkgrel=1
pkgdesc="An embedded terminal for Nemo, the Cinnamon file manager."
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo' 'imagemagick')
makedepends=('gnome-common')
install="${pkgname}.install"

source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('59dd194d32b20d40230a84b249733ccab0d846ecd299d611d25cee5367cdd0af')

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
