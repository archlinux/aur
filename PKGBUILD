# Maintainer: Kedap <dxhqezk@hi2.in>
pkgname=kali-archive-keyring
_pkgname=kali-archive-keyring-kali-master
pkgver=07d.6d757
pkgrel=1
pkgdesc="GnuPG archive keys of the Kali archive"
arch=('any')
url="https://pkg.kali.org/pkg/kali-archive-keyring"
license=('GPL')
makedepends=('jetring')
source=("https://gitlab.com/kalilinux/packages/${pkgname}/-/archive/kali/master/${pkgname}-kali-master.tar.gz")
sha256sums=('c36a241cffc6f3999af05cedb8bd6f556f80abc492b75466cc6e9f7f203963b0')
build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
}
