pkgname=wtmpdb
pkgver=0.74.0
pkgrel=1
pkgdesc="Login/logout event log (SQLite-based replacement of /var/log/wtmp)"
arch=(x86_64)
depends=(audit gcc-libs pam sqlite libsystemd)
url=https://github.com/thkukuk/wtmpdb
source=(git+https://github.com/thkukuk/wtmpdb#tag=v$pkgver)
sha256sums=('8b80f9275ec8c4eddccb5faf02e13e50731a3b25d5b7c73282ad470979b36121')

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
