# Contributor: graysky <graysky AT archlinux dot us>
pkgname=pulseaudio-ctl
pkgver=1.69
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
b2sums=('db55eec57e1204eef228ad331fd0b95bab2ee16625ca94fe4632ee713412b0686f1c1abc509f8c2ee0d1e6b08147f79ab961a4039fdadc351a88bcaedc13a9e0')
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

