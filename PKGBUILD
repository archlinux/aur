# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.5.11
_debian_backport=''
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('966281eb8301c14a1acc17e46c70061f73179d80e370aef43065c22f0947fb87')

build() {
	cd "${srcdir}/whois"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
