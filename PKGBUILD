# Maintainer:
pkgname=local-dns
pkgver=0.1
pkgrel=1
pkgdesc="With this package the user is able to define a wrapper around DNS resolution with which one can define some fake dns addresses that will be mapped to a specific device on a local network identified by a mac address."
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Local-DNS.git"
license=('GPL')
makedepends=('git' 'make' 'gcc>=10' 'autoconf')
source=("git+$url")
md5sums=('SKIP')


build() {
	cd "Local-DNS"
	git submodule init
	git submodule update
	sudo make libcrafter
	sudo make main
}

package() {
	cd "Local-DNS"
	sudo make DESTDIR="$pkgdir" install
}
