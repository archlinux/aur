# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libspf2-git
pkgver=1
pkgrel=1
pkgdesc="Implementation of the Sender Policy Framework for SMTP authorization"
arch=('i685' 'x86_64')
url="http://www.libspf2.org/"
license=('GPL')
makedepends=('gcc' 'git')
provides=('libspf2')

prepare() {
    git clone https://github.com/shevek/libspf2.git
}

build() {
	cd libspf2
	./configure --prefix=/usr
	make
}


package() {
	cd libspf2
	make DESTDIR="$pkgdir/" install
}
