# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.5.0
pkgrel=1
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://matteocorti.github.io/roll/"
license=('GPL2')
source=("https://github.com/matteocorti/roll/releases/download/v${pkgver}/roll-${pkgver}.tar.gz")
sha256sums=('a06b9782225442c71347eaf745e47684a9227d55575e865f503266c06454586c')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
