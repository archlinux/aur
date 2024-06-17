# Maintainer: Jordan Cannon <LiteracyFanatic@gmail.com>
pkgname=clipevent
pkgver=0.1.0
pkgrel=1
pkgdesc='Listen for changes to the X11 clipboard and print them to stdout as JSON'
arch=(x86_64)
url='https://github.com/LiteracyFanatic/ClipEvent'
license=('MIT')
depends=(xclip xorg-xprop)
options=('!strip')
makedepends=(git dotnet-sdk)
source=("git+https://github.com/LiteracyFanatic/ClipEvent#tag=v$pkgver")
sha256sums=(SKIP)

build() {
	cd "$srcdir/ClipEvent"
	dotnet publish -o dist
}

package() {
	cd "$srcdir/ClipEvent"
	install -Dm 755 dist/clipevent "$pkgdir/usr/bin/clipevent"
}
