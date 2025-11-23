# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=pam-tmpdir
pkgver=0.11
pkgrel=2
pkgdesc="PAM module for creating safe per-user temporary directories"
arch=(x86_64)
url="https://tracker.debian.org/pkg/pam-tmpdir"
license=('GPL-2.0-only')
depends=(pam)
source=("http://deb.debian.org/debian/pool/main/p/$pkgname/${pkgname}_${pkgver}.tar.gz")
sha256sums=(4ae30e292b10ebccc90618458bee6182dde792eb3bde687c8cc3d9866324cdf3)
install=install.sh

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

