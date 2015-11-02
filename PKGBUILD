# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributor: kagan <juanynie at gmail dot com>
# Contributor: padfoot <padfoot at exemail dot com dot au> 

_pkgname=Gelide
pkgname=gelide-git
pkgver=20150620.g10d8aec
pkgrel=2
pkgdesc="A front-end for any emulated system (git version)"
arch=('i686' 'x86_64')
url="http://gelide.sourceforge.net/"
license=("GPL3")
depends=('gtkmm' 'libxml2' 'gnome-icon-theme' 'gnome-doc-utils')
makedepends=('git' 'intltool')
conflicts=('gelide')
install=$pkgname.install
source=("git+https://github.com/tapule/Gelide.git")
md5sums=('SKIP')

build() {
cd $srcdir/$_pkgname
./autogen.sh --prefix=/usr
make CPPFLAGS='-std=c++11' || return 1
}
package() {
cd $srcdir/$_pkgname
make DESTDIR=$pkgdir install
}
