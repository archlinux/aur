# Contributor: Simo Leone <leone.simo AT gmail DOT com>
pkgname=amtterm
pkgver=1.5
pkgrel=1
pkgdesc="Tools to connect to Intel AMT enabled machines via Serial-Over-LAN"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/blog/linux/$pkgname/"
license=('GPL2')
depends=('perl-soap-lite')
source=("https://www.kraxel.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('064473485f29e7f7b6d1babfc2bb64f3'
         'SKIP')
validpgpkeys=('A0328CFFB93A17A79901FE7D4CB6D8EED3E87138') # Gerd Hoffmann (work) <kraxel@redhat.com>

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" prefix=/usr install
}

# vim: set ft=sh ts=4 sw=4 noet:
