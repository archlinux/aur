# Maintainer: Benoît Giraudou <archlinux.ajaiqwf5@giraudou.fr>
pkgname=stegseek
pkgver=0.6
pkgrel=1
pkgdesc="Lightning fast steghide cracker"
arch=('x86_64')
url="https://github.com/RickdeJager/stegseek"
license=('GPL')
depends=('mhash' 'libmcrypt' 'libjpeg' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RickdeJager/stegseek/archive/v${pkgver}.tar.gz")
sha256sums=('66cdd8e4e4b815d7fe368843e7df2f0416af0304df35e4f22db9f16c7ae6c771')

build() {
    cmake -B build -S "${srcdir}/stegseek-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}

