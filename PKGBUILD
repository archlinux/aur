# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

pkgname=mpd-mpris
pkgver=0.2.4
pkgrel=1
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=('any')
url='https://github.com/natsukagami/mpd-mpris'
makedepends=('go>=1.9' 'git')
source=("https://github.com/natsukagami/mpd-mpris/archive/v$pkgver.tar.gz")
sha256sums=('0988af1afbed51840397e4e74ffa853b2f7fc675ac0b638ea46e4223014fc7ad')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	go build -v -o mpd-mpris cmd/mpd-mpris/*.go
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
	install -D -m 0644 mpd-mpris.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}
