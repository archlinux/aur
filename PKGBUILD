# Maintainer: George Hilliard <thirtythreeforty@gmail.com>
pkgname=receivemidi
_pkgname=ReceiveMIDI
pkgver=1.6.1
pkgrel=1
pkgdesc="Multi-platform command-line tool to monitor and receive MIDI messages "
arch=('i686' 'x86_64')
url="https://github.com/gbevin/ReceiveMIDI"
license=('GPL3')
depends=('alsa-lib' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4b144de5ff6e30aead7ee87ead8beef27043b7deeb504dec1e0a93e05b77dd8c')

build() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
