# Maintainer: Stefan Göbel <aur —at— subtype —dot— de>

pkgname='systray-generic'
pkgver='2015101201'
pkgrel='1'
pkgdesc='Display system tray icons and run arbitrary programs when an icon is clicked.'
arch=('any')
url='https://gitlab.com/goeb/systray-generic/'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-docutils')
source=("$pkgname::git+https://gitlab.com/goeb/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
   cd "$pkgname"
   make
}

package() {
   cd "$pkgname"
   make install DESTDIR="$pkgdir/" PREFIX="/usr"
   rm -f "$pkgdir/usr/share/doc/$pkgname/COPYING"
}

#:indentSize=3:tabSize=3:noTabs=true:mode=shellscript:maxLineLen=87: