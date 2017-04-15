# Contributor: Simo Leone <leone.simo AT gmail DOT com>
pkgname=amtterm
pkgver=1.6
pkgrel=1
pkgdesc="Tools to connect to Intel AMT enabled machines via Serial-Over-LAN"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/blog/linux/$pkgname/"
license=('GPL2')
depends=('perl-soap-lite')
makedepends=('vte3')
optdepends=('vte3: for the gamt GUI')
source=("https://www.kraxel.org/releases/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('0134d1f28ca06bbf21e578f9c824e0c4'
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
