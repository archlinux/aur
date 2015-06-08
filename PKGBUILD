# Contributor: graysky <graysky AT archlinux dot us>
pkgname=pulseaudio-ctl
pkgver=1.61
pkgrel=1
pkgdesc='Control pulseaudio volume from the shell or mapped to keyboard shortcuts.'
arch=('any')
license=('MIT')
depends=('bc' 'libpulse>=4.0' 'pulseaudio>=4.0')
optdepends=('libnotify: to display volume and mute status')
conflicts=('pulseaudio_ctl')
replaces=('pulseaudio_ctl')
url=https://github.com/graysky2/pulseaudio-ctl
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('e486d8f60cffc26a0923eff84ab86515b9bfac57f20939b96d57c5763d647dd2')
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

