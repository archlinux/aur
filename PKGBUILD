# Maintainer: robertfoster

pkgname=whatweb-git
pkgver=v0.4.9.r440.7885799c
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('i686' 'x86_64')
replaces=('whatweb')
conflicts=('whatweb')
provides=('whatweb')
url="http://www.morningstarsecurity.com/research/whatweb"
license=('GPL')
depends=('ruby')
source=("whatweb::git://github.com/urbanadventurer/WhatWeb.git"
patch)

package() {
	cd whatweb
	patch -Np1 -i ../patch
	make DESTDIR=$pkgdir install
}

pkgver() {
	cd whatweb
	printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

md5sums=('SKIP'
'0de7ce37f82d813e06275f6e08a41fa1')
