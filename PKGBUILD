# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_term-bin
pkgver=0.9.0
pkgrel=1
provides=("icy_term")
pkgdesc="IcyTERM is a BBS terminal program with allows you to connect to BBSes"
groups=("icy_tools-bin")
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyTerm$pkgver/icy_term_linux_$pkgver.zip")
sha512sums=('87f45746be9f1caf005c3589b58834e8a3a8858a3f60740c5c2c6718adb8c59d8c929e27996a0f6da208d60e0741679bb47f48a1b9c7a8614db4ef4a584c978d')
b2sums=('643136bb1d9efa56505d3e7283812b4a3fdcbbe8f0b869d58396df5c3ac5d38dc77f23d155427833f065216b313e8812157263f694cb54f98e1013ad93b808c5')
prepare() {
	cd "${srcdir}/"
	ar -x "icy_term.deb"
	bsdtar -xvf data.tar.xz
}

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/usr/share/doc/icy-term/copyright" "$pkgdir/usr/share/doc/icy-term/copyright"
  install -DTm0755 "$srcdir/usr/share/applications/icy_term.desktop" "$pkgdir/usr/share/applications/icy_term.desktop"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/128x128/apps/icy_term.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/icy_term.png"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/256x256/apps/icy_term.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/icy_term.png"
  install -DTm0755 "$srcdir/usr/bin/icy_term" "$pkgdir/usr/bin/icy_term"
}
