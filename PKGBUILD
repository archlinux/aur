# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=pam-tmpdir
pkgver=0.09
pkgrel=2
pkgdesc="PAM module for creating safe per-user temporary directories"
arch=(x86_64)
url="https://tracker.debian.org/pkg/pam-tmpdir"
license=('GPL2')
depends=(pam)
source=("http://deb.debian.org/debian/pool/main/p/$pkgname/${pkgname}_${pkgver}.tar.gz")
sha256sums=(3176b5098e9a943f3713f43e3099acbfc35a22659dd293c929977fee76dee09f)
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

