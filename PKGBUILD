# Contributor: graysky <graysky AT archlinux dot us>
pkgname=pulseaudio-ctl
pkgver=1.64
pkgrel=1
pkgdesc='Control pulseaudio volume from the shell or mapped to keyboard shortcuts.'
arch=('any')
license=('MIT')
depends=('bc' 'libpulse' 'pulseaudio')
optdepends=('libnotify: to display volume and mute status')
conflicts=('pulseaudio_ctl')
replaces=('pulseaudio_ctl')
url=https://github.com/graysky2/pulseaudio-ctl
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('5861ed6a11d9046b0fcdbde3f64892be68d971e9a2a73c4d13ed56b6f5c5ebbc')
install=readme.install

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

