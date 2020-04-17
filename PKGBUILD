# Maintainer: hashworks <mail@hashworks.net>
pkgname=pam-ihosts
pkgver=1.5.7
pkgrel=2
pkgdesc="A PAM module that provides access control by ip, mac-address, or country-code/region."
license=("GPL3")
arch=("any")
depends=("pam")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
makedepends=("gcc" "binutils")
url='https://github.com/ColumPaget/pam_ihosts'
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(769f93da84f6c9b4fa7222b3d522d56ed78d536faac05fb9d267c105d1984fd4)

build() {
	cd "pam_ihosts-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "pam_ihosts-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
