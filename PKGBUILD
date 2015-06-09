# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: kagan <juanynie at gmail dot com>
# Contributor: padfoot <padfoot at exemail dot com dot au> 

_pkgname=Gelide
pkgname=gelide-git
pkgver=20131228.g0db66d3
pkgrel=1
pkgdesc="A front-end for any emulated system (git version)"
arch=('i686' 'x86_64')
url="http://gelide.sourceforge.net/"
license=("GPL3")
depends=('gtkmm' 'libxml2' 'gnome-icon-theme' 'gnome-doc-utils')
makedepends=('git' 'intltool')
conflicts=('gelide')
install=$pkgname.install
source=("git+https://github.com/tapule/Gelide.git" "$pkgname.patch")
md5sums=('SKIP'
         '7aa4e68495b41b9725192baf583c6f57')

build() {
patch -p1 < $srcdir/$pkgname.patch
cd $srcdir/$_pkgname
./autogen.sh --prefix=/usr
make || return 1
}
package() {
cd $srcdir/$_pkgname
make DESTDIR=$pkgdir install
}
