# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.4
_debian_backport='~bpo70+1'
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}${_debian_backport}.tar.xz")
sha256sums=('f8663fe3d5bc41a0be952979f46ea817bb953fc74181b3a151b5f996363a03a5')

build() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make mkpasswd
}

package() {
	cd "${srcdir}/whois-${pkgver}${_debian_backport}"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
