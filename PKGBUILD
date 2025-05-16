# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Tomasz Cielecki <tomasz@ostebaronen.dk>
# Contributor: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=sipcalc
pkgver=1.1.6
pkgrel=6
pkgdesc='An advanced console based IP subnet calculator'
arch=('aarch64' 'x86_64')
url="https://www.routemeister.net/projects/sipcalc/"
license=('BSD-3-Clause')
depends=('glibc')
source=("https://www.routemeister.net/projects/sipcalc/files/$pkgname-$pkgver.tar.gz")
sha256sums=('cfd476c667f7a119e49eb5fe8adcfb9d2339bc2e0d4d01a1d64b7c229be56357')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm0644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
