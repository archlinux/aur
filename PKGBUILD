# Maintainer: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.5
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

sha256sums=('73faf2a672581ef993f8ac678e37fe10b9a466a28ec21bd3c3050e54dd722539')
