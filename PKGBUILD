# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=wxhexeditor
pkgver=0.24
pkgrel=2
pkgdesc="A free hex editor / disk editor for Linux, Windows and MacOSX"
arch=('i686' 'x86_64')
url="http://www.wxhexeditor.org"
license=('GPL2')
depends=('wxgtk3')
makedepends=('python')
source=("https://github.com/EUA/wxHexEditor/archive/v$pkgver.tar.gz")
md5sums=('1b77bddc026e22797fd0e7a82e52cd28')

build() {
    cd "$srcdir/wxHexEditor-$pkgver"
    make WXCONFIG="/usr/bin/wx-config-gtk3"
}

package() {
    cd "$srcdir/wxHexEditor-$pkgver"
    make WXCONFIG="/usr/bin/wx-config-gtk3" DESTDIR="$pkgdir" PREFIX="/usr" install
}
