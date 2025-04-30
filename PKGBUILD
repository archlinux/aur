# Maintainer: Christopher Hamilton <marker5a@gmail.com>

pkgname=easyterm
_gitname=easyterm
pkgver=0.9.3
pkgrel=1
pkgdesc='Serial Port Terminal Emulator'
arch=('x86_64' 'i686')
url='https://github.com/marker5a/EasyTerm'

license=('GPLv3')
depends=('qt5-serialport')
makedepends=('git' 'qt5-base')
optdepends=()
provides=(easyterm)
replaces=(easyterm)
conflicts=(easyterm-git)

source=('easyterm::git+https://github.com/marker5a/EasyTerm.git#tag=v0.9.3')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"

  qmake-qt5 .
  make
}

package() {
	
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	mkdir -p "$pkgdir/usr/share/applications"
	
	cp "$srcdir/$_gitname/release/EasyTerm" "$pkgdir/usr/bin"
	cp "$srcdir/$_gitname/resources/easyterm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	cp "$srcdir/$_gitname/easyterm.desktop" "$pkgdir/usr/share/applications/"
	
}

# vim:set ts=2 sw=2 et:
