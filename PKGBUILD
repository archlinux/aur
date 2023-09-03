# Maintainer: eNV25 <env252525@gmail.com>

pkgname=webtorrent-mpv-hook
pkgver=1.4.1
pkgrel=2
pkgdesc="script that allows mpv to stream torrents"
arch=(any)
url="https://github.com/mrxdst/webtorrent-mpv-hook"
# the license is specified in package.json, but a LICENSE file is not provided
license=('ISC')
depends=('nodejs' 'mpv')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")

package() {
	npm install --cache "$srcdir/npm-cache" -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
	mkdir -p "$pkgdir/etc/mpv/scripts/"
	ln -srvf "$pkgdir/usr/lib/node_modules/webtorrent-mpv-hook/build/webtorrent.js" "$pkgdir/etc/mpv/scripts/webtorrent.js"
}

sha256sums=('fac6746d3af934ddf08036929435697ec31e15582f0c293f83b9b01d3116dd92')
