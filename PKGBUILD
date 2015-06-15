#!/bin/sh
# Maintainer: Jorge Barroso <jorge.barroso.11@gmail.com>

pkgname=baamanga-git
pkgver=0.5.6.r0.gbbb7604
pkgrel=1
pkgdesc="Command-line tool to download manga from lots of  websites. Git version"
arch=('i686' 'x86_64')
url="http://baamanga.tk"
license=('GPL2')
depends=('curlcpp-git' 'boost-libs')
makedepends=('boost')
provides=(baamanga)
conflicts=(baamanga)
install=baamanga.install
source=(baamanga::"git://git.code.sf.net/p/baamanga/code")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/baamanga"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build(){
	cd "$srcdir/baamanga"
	autoreconf --install
	./configure
	make
}

package() {
	cd "${srcdir}/baamanga"
	make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
