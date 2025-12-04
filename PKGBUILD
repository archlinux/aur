# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_term-bin
pkgver=0.8.0
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
sha256sums=('4e290f80fab9517c4749578f84870646d774b92908f0a6c8f7dce91fd1e78545')
sha512sums=('bbe5178dd36f560e6d6cf36c1545e1382447ebb96f39767dc28e2361b0508a2336eeb7953d445c711889e5ddf24b2a890a59052bd2034e6a02f60eb9b30199e2')

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
