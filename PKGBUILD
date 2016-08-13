# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.1.0
pkgrel=1
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://matteocorti.github.io/roll/"
license=('GPL2')
source=("https://github.com/matteocorti/roll/releases/download/v${pkgver}/roll-${pkgver}.tar.gz")
sha256sums=('d0cfeb1607d06fcd2af72c06a19f5dd8b577e055b9d6dce3d6d02904b0f1fda4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
