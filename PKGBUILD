# Maintainer: fengyifan <fengyifan@outlook.com>
pkgname=netease-cloud-music-web-player
pkgver='1.0.0'
pkgrel=1
pkgdesc="基于网页播放器封装的网易云音乐客户端"
arch=('x86_64')
license=('unknown')
depends=('electron')
url="https://github.com/feng-yifan/netease-cloud-music-web-player"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f57d1d9263a0621d49089483ed9ba3346f87a097e7bd35ab570ceff516f661d9')
package() {
	cd "$srcdir"
	tar -xzf "$pkgname-$pkgver.tar.gz"
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	cp "app.asar" "$pkgdir/usr/lib/$pkgname/"
	install -dm755 "$pkgdir/usr/bin"
	install -m755 "netease-cloud-music-web-player" "$pkgdir/usr/bin/$pkgname"
	install -dm755 "$pkgdir/usr/share/applications"
	install -m644 "netease-cloud-music-web-player.desktop" "$pkgdir/usr/share/applications/"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	install -m644 "netease-cloud-music.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
