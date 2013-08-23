# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.0.26
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz")
sha256sums=('729625ef81425f4771e06492bb4f3e9f24bff75b8176044ce8d2f605f7ad6af5')

build() {
	cd "$srcdir/whois-$pkgver"
	make mkpasswd
}

package() {
	cd "$srcdir/whois-$pkgver"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
