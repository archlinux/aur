#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Alessio 'Bl@ster' Biancalana <dottorblaster@gmail.com>

pkgname=libslab
pkgver=2.30.0
pkgrel=1
pkgdesc="Beautification app library file"
arch=('i686' 'x86_64')
url="http://en.opensuse.org/GNOME/Slab"
license=('GPL')
depends=('libbonobo' 'glib2' 'gtk2' 'gnome-panel')
makedepends=('librsvg' 'libsm')
source=(http://ftp.gnome.org/pub/gnome/sources/libslab/2.30/${pkgname}-${pkgver}.tar.gz)
sha512sums=('c8377800d7fbf72889adf86c3f3f91057c95d2ebb8f37750a16a2f0a89a0d2d6680ed2005c22ae702da6463cb0653595c9fbabf9f4db1c41482b3331fe83bda5')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
	}

package() {
	make DESTDIR="$pkgdir/" install
	}
