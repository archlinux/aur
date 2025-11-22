# Maintainer: fengyifan <fengyifan@outlook.com>
pkgname=netease-cloud-music-web-player
pkgver='1.0.0'
pkgrel=1
pkgdesc="基于网页播放器封装的网易云音乐客户端"
arch=('x86_64')
license=('unknown')
depends=('electron')
url="https://github.com/feng-yifan/Netease-Cloud-Music-Web-Player"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('820341f46ebc31bb79cc8005fc8a93e82793eaa05b50e275cbf7c53337d8c800')
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
