# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=firejail-apparmor
pkgver=0.9.42
pkgrel=1
pkgdesc="Apparmor support for Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL2')
depends=('apparmor-profiles' 'apparmor-utils')
provides=('firejail=0.9.42')
conflicts=('firejail')
source=("https://sourceforge.net/projects/firejail/files/firejail/firejail-0.9.42.tar.xz/download")
sha1sums=('f6ec8198a08c3fffed681c03c3b591b4d9da8d57')



build() {
	cd ${srcdir}/firejail-0.9.42
	./configure --prefix=/usr --enable-apparmor
	make
}


package() {
	cd ${srcdir}/firejail-0.9.42
	make DESTDIR="$pkgdir/" install
}

