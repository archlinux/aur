# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Bastien Dejean <baskerville@lavabit.com>

pkgname=libunicodenames
pkgver=1.2.2
pkgrel=1
pkgdesc='Library for retrieving Unicode annotation data'
url='https://sourceforge.net/projects/sortsmill/files/libunicodenames/'
license=('GPL3')
arch=('x86_64')
makedepends=('wget')
source=("https://downloads.sourceforge.net/project/sortsmill/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('1ae6002f89a15d6f7299f900eb6d3f5aecbe3661695b147f4b94a9639007f01c')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr --libexecdir=/usr/lib
	make PREFIX=/usr
}

package() {
	cd ${pkgname}-${pkgver}
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
