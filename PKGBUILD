# Maintainer: Michael(Pineman13) <Pineman13@openaliasbox.org>
pkgname=dmitry
pkgver='1.2a'
pkgrel=1
pkgdesc="Simple utility to perform host audition and extended whois queries using Google and ICANN"
arch=('i686' 'x86_64')
url='http://mor-pah.net/software/dmitry-deepmagic-information-gathering-tool/'
license=('GPL')
depends=('glibc')
source=("https://dl.packetstormsecurity.net/UNIX/misc/DMitry-$pkgver.tar.gz")
md5sums=('5917242266383be3aa7e0e618ae0c015')

build() {
	cd "${pkgname//dm/DM}-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname//dm/DM}-$pkgver"
	make DESTDIR="$pkgdir/" install
}
