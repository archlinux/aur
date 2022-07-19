# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=roll
pkgver=2.6.1
pkgrel=1
pkgdesc="A tool to roll a user-defined dice sequence and display the result"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://matteocorti.github.io/roll/"
license=('GPL2')
source=("https://github.com/matteocorti/roll/releases/download/v${pkgver}/roll-${pkgver}.tar.gz")
sha256sums=('399bd4958d92f82fb75ff308decb2d482c9a8db80234014f6d42f6513b144179')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
