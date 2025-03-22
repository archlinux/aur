# Maintainer: Tomasz Kramkowski <tk@the-tk.com>
pkgname=containers
pkgver=1.7
pkgrel=1
pkgdesc="Lightweight containers using Linux user namespaces"
url="https://github.com/arachsys/containers"
license=(MIT)
arch=(x86_64 i686)
depends=(glibc)
source=("$url/archive/containers-$pkgver.tar.gz")
sha256sums=("5f43ffaf9bcfc73032cafeb94fe9596dcfa0b26f0bd2730656c3daa4341d9c02")

build() {
	cd "$pkgname-$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README TIPS
}
