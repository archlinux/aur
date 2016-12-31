# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.10.2
pkgrel=2
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=("https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=('833aef3cede36c33e5df869a2c12f992c4ea38cf1908920327f99650ddc0715e')

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
