# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.11
_debian_backport=''
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('32f7d6be853aa6a6a8ac6dd672bd60ae4f10bc0bedcaa944363ffbef6e57cef7')

build() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
