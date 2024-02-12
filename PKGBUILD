# Maintainer: infeeeee <infeeeee at aaathats3as dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

## GPG keys are available on Ubuntu keyserver
## gpg --keyserver keyserver.ubuntu.com --recv-keys <KEY>

pkgname=libredwg
pkgver=0.13.2
pkgrel=4
pkgdesc="A free C library to handle DWG files"
arch=('x86_64')
url="https://gnu.org/software/libredwg/"
license=('GPL3')
depends=('python' 'pcre2' 'perl' 'swig')
provides=('python-libredwg')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('7c517bc58267fb97ae063568969b16b248b74cb0bfe4a8232eec4f751d9468ff'
            'SKIP')
validpgpkeys=('2895A881D34270FABFE8F747B4F63339E65D6414') ## Reini Urban

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
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

