# Maintainer: Thomas Hebb <tommmyhebb@gmail.com>
pkgname=debian-whois-mkpasswd
pkgver=5.2.2
pkgrel=1
pkgdesc="A features-rich front end to the password encryption function crypt(3)."
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/whois"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz")
sha256sums=('cba874b457a6b7c4659245780d3d7321d129ab47da86103e07578ec7430fec09')

build() {
	cd "$srcdir/whois-$pkgver"
	make mkpasswd
}

package() {
	cd "$srcdir/whois-$pkgver"
	make BASEDIR="$pkgdir/" install-mkpasswd
}
