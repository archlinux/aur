# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.11.2
pkgrel=2
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=("https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=('20e9109fe5dd21c9294a94cba12b65cc7650f359e52e7a16f3bdc89e802e13f0')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	autoreconf -fi
	./configure --prefix=/usr --disable-rpath
	make
}

check() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make check
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
