# Maintainer: graysky <therealgraysky AT protonmail dot com>

pkgname=pulseaudio-ctl
pkgver=1.70
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
b2sums=('bd752c42a6ec7c205112637a11e2abae1474b2bcb43f09fa46439b1509c816e8baadd547868821f495f79acf9606bc913ee8664286f181357e264ffa3cdf60f9')
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

