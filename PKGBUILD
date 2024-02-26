# Maintainer: infeeeee <infeeeee at aaathats3as dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

## GPG keys are available on Ubuntu keyserver
## gpg --keyserver keyserver.ubuntu.com --recv-keys <KEY>

pkgname=libredwg
pkgver=0.13.3
pkgrel=1
pkgdesc="A free C library to handle DWG files"
arch=('x86_64')
url="https://gnu.org/software/libredwg/"
license=('GPL3')
depends=('python' 'pcre2' 'perl' 'swig')
provides=('python-libredwg')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('6fe6c273ecbb04d4a7646e1636ede4815b51f98f974cece649dab341d24feda2'
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

