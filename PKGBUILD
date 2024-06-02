# Maintainer: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.3
pkgrel=1
pkgdesc="script that allows mpv to stream torrents"
arch=(any)
url="https://github.com/mrxdst/webtorrent-mpv-hook"
license=('Unlicense')
depends=('nodejs' 'mpv')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")

package() {
	npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
	mkdir -p "$pkgdir/etc/mpv/scripts/"
	ln -srvf "$pkgdir/usr/lib/node_modules/$pkgname/build/webtorrent.js" "$pkgdir/etc/mpv/scripts/webtorrent.js"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	ln -srvf "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('6b8d8f9df216036880b83c3dd7ca712001014b1400a8130082011e5cd1c0f5e2')
