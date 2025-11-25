# Maintainer: fengyifan <fengyifan@outlook.com>
pkgname=netease-cloud-music-web-player
pkgver='1.0.2'
pkgrel=1
pkgdesc="基于网页播放器封装的网易云音乐客户端"
arch=('x86_64')
license=('MIT')
depends=('electron')
url="https://github.com/feng-yifan/Netease-Cloud-Music-Web-Player"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bbb009540de8557c4134600f8342f779d2ad837dae4eb9490a6ebc94d38b75c9')
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
