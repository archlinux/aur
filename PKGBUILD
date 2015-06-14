# Maintainer: another <code § deadcode § eu>
# Contributor: Lazaros Koromilas <koromilaz@gmail.com>

pkgname=postal
pkgver=0.72
pkgrel=2
pkgdesc="An SMTP and POP benchmark"
arch=('i686' 'x86_64')
url="http://doc.coker.com.au/projects/postal/"
license=('GPL')
depends=('gnutls' 'libgcrypt')
source=("http://www.coker.com.au/postal/$pkgname-$pkgver.tgz")
sha256sums=('70d59adf8ab006a6ea389d8f276a265de743330458f5c1affb97d86bb0663bad')
sha384sums=('d5747ad8f7400d9fb2c642864c0470ccae3d28bc23e1065a4ef83262d44da198ce9337545537a053bdb13e6c3853512d')
sha512sums=('858d5a3ec452e868d6026d631d59260eab83e90c64ce185bf9c6cecd3494c591ba7cb1455f35a5f003acbbe33f4974669e6820750e4d4ce9432d72b350263c99')

prepare() {
	cd "$pkgname-$pkgver"

	sed -i 's/sbin/bin/g' Makefile*
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
