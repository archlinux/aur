# Maintainer: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.2
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
	ln -srvf "$pkgdir/usr/lib/node_modules/webtorrent-mpv-hook/build/webtorrent.js" "$pkgdir/etc/mpv/scripts/webtorrent.js"
	mkdir -p "$pkgdir/usr/share/licenses/"
	ln -srvf "$pkgdir/usr/lib/node_modules/webtorrent-mpv-hook/LICENSE" "$pkgdir/usr/share/licenses/LICENSE"
}

sha256sums=('63ff0918b8130762f91a11988fe2e8c69cf5c89326f7eb7802b69145e9183c0d')
