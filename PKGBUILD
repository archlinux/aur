# Maintainer: aulonsal <aulonsal at gmail dot com>
pkgname=f2-bin
pkgver=1.6.1
pkgrel=1
pkgdesc="Cross-platform command-line tool for batch renaming files and directories quickly and safely"
arch=(x86_64 i686 aarch64)
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_i386.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums_x86_64=('bae7ec9bb1784d0a3c368241a1918b4ca4f9c40618e637d850105d9e5a41a3d04db9739d454f7ff4b717b7951f4314228b802aa4f94929a6b507ad8cc95b730d')
b2sums_i686=('bae7ec9bb1784d0a3c368241a1918b4ca4f9c40618e637d850105d9e5a41a3d04db9739d454f7ff4b717b7951f4314228b802aa4f94929a6b507ad8cc95b730d')
b2sums_aarch64=('bae7ec9bb1784d0a3c368241a1918b4ca4f9c40618e637d850105d9e5a41a3d04db9739d454f7ff4b717b7951f4314228b802aa4f94929a6b507ad8cc95b730d')

noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
	cd "$srcdir"
	mkdir -p "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	bsdtar -xf ../"$pkgname-$pkgver.tar.gz"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENCE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
