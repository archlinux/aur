# Maintainer: Tomasz Kramkowski <tk@the-tk.com>
pkgname=containers
pkgver=1.6
pkgrel=1
pkgdesc="Lightweight containers using Linux user namespaces"
url="https://github.com/arachsys/containers"
license=(MIT)
arch=(x86_64 i686)
depends=(glibc)
source=("$url/archive/containers-$pkgver.tar.gz")
sha256sums=("38a13fc323f163657fa6c1aa8653e468eb003eae7de071c16acf810cdd1ce981")

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
