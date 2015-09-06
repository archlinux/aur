# Maintainer: Kevin Guan <KevinGuan.gm@gmail.com>

pkgname=iptux
pkgver=0.6.2
pkgrel=1
pkgdesc="A software for sharing in LAN"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/iptux-src/iptux/"
depends=('make' 'autoconf' 'libtool' 'automake')
source=(https://codeload.github.com/iptux-src/${pkgname}/tar.gz/v${pkgver})
sha256sums=('d567096d97b3b168dde1510f0ca00a13c6f8bb596131c234482377d7d8fb211b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
