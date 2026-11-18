# Maintainer: infeeeee <infeeeee at aaathats3as dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

## GPG keys are available on Ubuntu keyserver
## gpg --keyserver keyserver.ubuntu.com --recv-keys <KEY>

pkgname=libredwg
pkgver=0.14
pkgrel=1
pkgdesc="A free C library to handle DWG files"
arch=('x86_64')
url="https://gnu.org/software/libredwg/"
license=('GPL3')
depends=('python' 'pcre2' 'perl' 'swig')
provides=('python-libredwg')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('cb6ee0b078c6d9e0f09d66f1feac33ba6342df88ae544e9f9335fab475218351'
            'SKIP')
validpgpkeys=('38A4167B0DB69E49C5F7216CB8C28866AB27A7A2') ## Reini Urban

build() {
	cd "$pkgname-$pkgver"
	./configure --disable-werror --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

