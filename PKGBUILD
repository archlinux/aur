# Contributor: Cody Regester <cody@llanet.tk>

pkgname=libki
pkgver=24.01
_commit=31dfc839565284c42bd99f61072d982c1380f4e4
pkgrel=1
pkgdesc="Kiosk Management System Client"
arch=('x86_64')
url="https://libki.org"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'qt5-script' 'qt5-webkit')
backup=('etc/libki/Libki.ini')
source=("https://github.com/Libki/libki-client/archive/refs/tags/libki-client-unstable-v${_commit}.tar.gz")
sha256sums=('c60f4de345e811893e775aeee2a4f36798594f7bbd80136295c6181f507b2596')

build() {
	cd "libki-client-libki-client-unstable-v$_commit"
	qmake Libki.pro
	make
}

package() {
	cd "libki-client-libki-client-unstable-v$_commit"
	install -Dm755 libkiclient -t "$pkgdir/usr/bin"
	install -Dm644 example.ini "$pkgdir/etc/libki/Libki.ini"
}
