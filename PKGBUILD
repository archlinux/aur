# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.20
_debian_backport=''
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('6848ab671750ab3782fe4ab2a47910fe4e25aa93894e4d0f3f67b5fcee06c009')

build() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
