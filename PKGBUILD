# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_term-bin
pkgver=0.9.2
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
sha512sums=('170b834be4d676b5b5e8abedcfd545d178a0e874227bb2e3f9ca251c976b3eb9651edf901dbcc4977322def10e9f1c19932d19f85189bb99ba3f0cc86d350fe9')
b2sums=('6393d0e07d4f3c0589cf44f80909e084dd8f006e0abdd6d529bb27674bdafafeb0b7330efd3d842f5de6bc620b737a30fe37243419b2d8cf10a9bd0e34adc6d7')
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
