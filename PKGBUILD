# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-image-converter
pkgver=3.0.0
_mintrel=betsy
pkgrel=1
pkgdesc="nemo extension to mass resize or rotate images"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.0' 'nemo<3.1' 'imagemagick')
makedepends=('gnome-common')
install="${pkgname}.install"

source=("http://packages.linuxmint.com/pool/main/n/${pkgname}/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('87f795984d246c33921b84ac0aec5bbfc5be935c2b83a396e063344ab2203a61')

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
