# Maintainer: George Hilliard <thirtythreeforty@gmail.com>
pkgname=receivemidi
_pkgname=ReceiveMIDI
pkgver=1.6.2
pkgrel=1
pkgdesc="Multi-platform command-line tool to monitor and receive MIDI messages "
arch=('i686' 'x86_64')
url="https://github.com/gbevin/ReceiveMIDI"
license=('GPL3')
depends=('alsa-lib' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d2717767f72b3ce543712b2d5f2c694a713fa91cd7b64e672a02be2119e7bfcf')

build() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
