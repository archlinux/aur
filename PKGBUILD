# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.1.4
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz")
sha256sums=('678f8677d0e2d4836b14c8e95ad875ec569cec282572635f920888462cc5daef')

build() {
	cd "$srcdir/whois-$pkgver"
	make mkpasswd
}

package() {
	cd "$srcdir/whois-$pkgver"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
