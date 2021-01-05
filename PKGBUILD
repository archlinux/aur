# Maintainer: Benoît Giraudou <archlinux.ajaiqwf5@giraudou.fr>
pkgname=stegseek
pkgver=0.5
pkgrel=1
pkgdesc="Lightning fast steghide cracker"
arch=('x86_64')
url="https://github.com/RickdeJager/stegseek"
license=('GPL')
depends=('mhash' 'libmcrypt' 'libjpeg' 'zlib')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RickdeJager/stegseek/archive/v${pkgver}.tar.gz")
sha512sums=('9155ddbbbe651e688cfe3665c9ec2237f1eb7b7b3c95c3f82721b17dc99c4a532a5e6213cbe4f884bdb951b74f7d1923e73f08a3e155470188b07f3cdeb6c048')

build() {
    cmake -B build -S "${srcdir}/stegseek-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}

