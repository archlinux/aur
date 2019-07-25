# Maintainer: Nguyen Pham Cao <natsukagami at gmail dot com>

_gopkgname='github.com/natsukagami/mpd-mpris'

pkgname=mpd-mpris
pkgver=0.2.3
pkgrel=1
pkgdesc='An implementation of the MPRIS protocol for MPD.'
arch=('any')
url='https://github.com/natsukagami/mpd-mpris'
makedepends=('go>=1.9' 'git')
source=("https://github.com/natsukagami/mpd-mpris/archive/v$pkgver.tar.gz")
sha256sums=('603595ac88585cac5ed67cd3ca4d06eff8d31a427f276cec22898dc5aee01d22')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	go build -v -o $srcdir/mpd-mpris $_gopkgname/cmd/mpd-mpris
}

package() {
	install -D -m 0755 mpd-mpris "$pkgdir/usr/bin/mpd-mpris"
	install -D -m 0644 mpd-mpris.service "$pkgdir/usr/lib/systemd/user/mpd-mpris.service"
}