# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

## GPG keys are available on Ubuntu keyserver
## gpg --keyserver keyserver.ubuntu.com --recv-keys <KEY>

pkgname=libredwg
pkgver=0.12.5
pkgrel=3
pkgdesc="A free C library to handle DWG files"
arch=('x86_64')
url="https://gnu.org/software/libredwg/"
license=('GPL3')
depends=('python' 'pcre2' 'perl' 'swig')
provides=('python-libredwg')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('4b5b38943e4a060bfee34a8542701b26102262610b1dd4dc58d76fadfb995106'
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

