# Maintainer: George Hilliard <thirtythreeforty@gmail.com>
pkgname=receivemidi
_pkgname=ReceiveMIDI
pkgver=1.2.0
pkgrel=1
pkgdesc="Multi-platform command-line tool to monitor and receive MIDI messages "
arch=('i686' 'x86_64')
url="https://github.com/gbevin/ReceiveMIDI"
license=('GPL3')
depends=('alsa-lib' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('df02505d5b1c97e3c228d5f110aef5ac4384362903c4dedc9ac1c3310419f739')

build() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
