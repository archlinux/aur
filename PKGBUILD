# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.1.1
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz")
sha256sums=('69fb4c3d964603967d18b931c2275e678eed5c33af0a74c41198e1b46a520644')

build() {
	cd "$srcdir/whois-$pkgver"
	make mkpasswd
}

package() {
	cd "$srcdir/whois-$pkgver"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
