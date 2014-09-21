# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.0
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz")
sha256sums=('f487bba00fc506b18b519d913509d9e050cba0b6f025e26a50b29b3e6322530b')

build() {
	cd "$srcdir/whois-$pkgver"
	make mkpasswd
}

package() {
	cd "$srcdir/whois-$pkgver"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
