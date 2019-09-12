# Contributor: graysky <graysky AT archlinux dot us>
pkgname=pulseaudio-ctl
pkgver=1.67
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

sha256sums=('7e0ae9f96b44ae6e5d361133aa89b7bbf3136407f164f1545f030f8bee7fa635')
