# Maintainer: George Hilliard <thirtythreeforty@gmail.com>
pkgname=receivemidi
_pkgname=ReceiveMIDI
pkgver=1.4.4
pkgrel=1
pkgdesc="Multi-platform command-line tool to monitor and receive MIDI messages "
arch=('i686' 'x86_64')
url="https://github.com/gbevin/ReceiveMIDI"
license=('GPL3')
depends=('alsa-lib' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8e89b22c599bfeafd76b598579d9c3b3a6544adc72267d29ddcd315db3d34c3b')

build() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
