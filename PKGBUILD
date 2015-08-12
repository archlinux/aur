# Contributor: Aliaksandr Stelmachonak <mail.avatar@gmail.com>
# Contributor: Natrio <natrio@list.ru>

pkgname=libnatspec
pkgver=0.2.6
pkgrel=2
pkgdesc="A collection of functions for request various charsets and locales for host system and for other 
system."
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://sourceforge.net/projects/natspec/"
license=('LGPL')
source=(
	"http://sourceforge.net/projects/natspec/files/natspec/0.2.6/libnatspec-0.2.6.tar.bz2"
)
md5sums=(
	'b57683f2e7be837992bffead1a6d3733'
)
                  
build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
