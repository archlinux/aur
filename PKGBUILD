# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

## You can retrieve the GPG key using
## gpg --keyserver keyserver.ubuntu.com --recv-keys 748EA0E81CB8A7489BFA6CE4670322244C807502

pkgname=alive
pkgver=2.0.5
pkgrel=3
pkgdesc='Periodic ping program'
url='https://gnu.org/software/alive'
arch=('any')
license=('GPL3')
depends=('guile' 'iputils')
source=("$pkgname-$pkgver.tar.lz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.lz"
        "$pkgname-$pkgver.tar.lz.sig::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.lz.sig")
sha256sums=('94cf3dbffd9644405ed4944f94a7bb989674321607318c5a35d5fabc56a75089'
            'SKIP')
validpgpkeys=('748EA0E81CB8A7489BFA6CE4670322244C807502') ## Thien-Thi Nguyen

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
