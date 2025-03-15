pkgname=wtmpdb
pkgver=0.72.0
pkgrel=1
pkgdesc="Login/logout event log (SQLite-based replacement of /var/log/wtmp)"
arch=(x86_64)
depends=(audit gcc-libs pam sqlite libsystemd)
url=https://github.com/thkukuk/wtmpdb
source=(git+https://github.com/thkukuk/wtmpdb#tag=v$pkgver)
sha256sums=(SKIP)

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
