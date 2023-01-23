# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
pkgname=sendmidi
_pkgname=SendMIDI
pkgver=1.2.0
pkgrel=1
pkgdesc="Multi-platform command-line tool to send out MIDI messages"
arch=('i686' 'x86_64')
url="https://github.com/gbevin/SendMIDI"
license=('GPL3')
depends=('alsa-lib' 'curl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('8d7ead088b820f69de9981745f5e6301')

build() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver/Builds/LinuxMakefile/build"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
