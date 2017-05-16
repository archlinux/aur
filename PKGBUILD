# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-ssh
pkgver=0.11.1
pkgrel=2
pkgdesc='SSH module for Guile based on libssh'
arch=('x86_64' 'i686')
url="https://github.com/artyom-poptsov/guile-ssh"
license=('GPL3')
depends=(
  'guile>=2.0.9'
  'libssh>=0.7.3')
source=("https://github.com/artyom-poptsov/guile-ssh/archive/v${pkgver}.tar.gz")
sha256sums=('875902dd6935038ddc826e4435f3df22ab5d07f5e95fe1eb31b3465ad5958327')

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
