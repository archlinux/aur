# Maintainer: Jason S. Wagner <jason at jasonswagner dot com>
# To import the GPG key, run: gpg --recv-keys 0x28D618AF --keyserver hkp://keys.gnupg.net

# Begin PKGBUILD

pkgname=ccd2cue
pkgver=0.5
pkgrel=1
pkgdesc="Convert CloneCD cuesheets (.ccd) to less-compatible CDRWIN cuesheets (.cue)."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/ccd2cue/"
license=('GPL3')
source="http://ftpmirror.gnu.org/$pkgname/$pkgname-$pkgver.tar.gz"
sha256sums=('8725cfdbcb963259ff094a878aa0e49ea8284e1071ea36ac7ea47358c49b99c5')
validpgpkeys=('7CB1208C733656B75962250027B9C6FD28D618AF')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
