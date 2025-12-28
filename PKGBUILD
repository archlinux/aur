# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_term-bin
pkgver=0.8.2
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
sha256sums=('a419beaca759bc05da878c0aba85a11877ec77b482b914f09f03235139440e18')
sha512sums=('10ff1f83ad01ab66c123e8bb83a584ff190b52128629d803f36f78801fcc4073346f1bbbc5a85ee121a0c68a88e2a81d4ddc206491fa3012a65175327c546939')

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
