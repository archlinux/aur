# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.5.13
_debian_backport=''
pkgrel=2
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL2')
depends=('libxcrypt')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('62e613f116d5635aea6684238db00b030a6602ffc79462e4a0a8e62cb184b5d7')

build() {
	cd "${srcdir}/whois"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
