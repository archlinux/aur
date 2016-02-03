# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.0.2
pkgrel=2
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://matteocorti.github.io/roll/"
license=('GPL2')
source=("https://github.com/matteocorti/roll/releases/download/v${pkgver}/roll-${pkgver}.tar.gz")
sha256sums=('633fde029934264c55a6e60856b56ab9492263f6f9a4b5dad53b56afa6f774d1')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
