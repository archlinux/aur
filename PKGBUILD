# Maintainer: Joel Grunbaum <joel@joelg.net>
_pkgname=pappl
pkgname=$_pkgname-git
pkgver=r512.cae4783
pkgrel=1
pkgdesc="PAPPL - Printer Application Framework"
arch=('x86_64')
url="https://www.msweet.org/pappl/index.html"
license=('Apache')
depends=()
makedepends=('git' 'avahi' 'libcups' 'gnutls' 'libjpeg-turbo' 'pam' 'libpng' 'zlib' 'libusb')
source=('git+https://github.com/michaelrsweet/pappl.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
