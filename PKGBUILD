#!/bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=baamanga
pkgver=0.5.6
pkgrel=1
pkgdesc='Command-line tool to download manga from lots of websites'
arch=('i686' 'x86_64')
url="https://github.com/jorge-barroso/baamanga/"
license=('GPL2')
depends=('curlcpp-git'
	 'boost-libs')
makedepends=('boost')
provides=(baamanga)
conflicts=(baamanga-git)
install=baamanga.install
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}-${pkgver}.zip")
sha512sums=('37250dcf203c6c60f2995c781a8c7969e866c51c5be00ecdf511d03f8004dc9630d4ebf5c558c336b6cdb5a45828e31fbf539a2970fd7d9de8b64779acf339ea')

build(){
cd ${srcdir}/
	autoreconf --install
	./configure
	make
}

package() {
cd ${srcdir}/
	make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:

