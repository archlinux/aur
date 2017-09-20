# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.18
_debian_backport=''
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('c35d0d26aff37107c244a8ad54fd42e497ec0b90f76309e9beb7078b827c97d5')

build() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
