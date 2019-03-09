# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.4.1
_debian_backport=''
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('3ee6591fb14c103791430a8e6eb3d4c38a9f52aad799ea58c94250bd6985ec50')

build() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
