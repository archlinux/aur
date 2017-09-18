# Contributor: graysky <graysky AT archlinux dot us>
pkgname=pulseaudio-ctl
pkgver=1.65
pkgrel=1
pkgdesc='Control pulseaudio volume from the shell or mapped to keyboard shortcuts.'
arch=('any')
license=('MIT')
depends=('bc' 'libpulse' 'pulseaudio')
optdepends=('libnotify: to display volume and mute status')
conflicts=('pulseaudio_ctl')
replaces=('pulseaudio_ctl')
url='https://github.com/graysky2/pulseaudio-ctl'
source=("$pkgname-$pkgver.tar.gz::https://github.com/graysky2/pulseaudio-ctl/archive/v$pkgver.tar.gz")

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

sha256sums=('0b81b1492451a1b00c1d4064c5c7c602c6ee9f2d8fcdfa001bed4690e8bac33d')
