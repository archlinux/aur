#Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
#Contributor: Dwight Schauer <dschauer@gmail.com>
#Contributor: GdelaRey <arch at delarey dot org>
#Maintainer: aksr <aksr at t-com dot me>
_pkgname=the
pkgname=hessling-editor-das
pkgver=3.3RC8
_pkgver=3.3
pkgrel=1
pkgdesc="A powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
arch=('i686' 'x86_64')
url="http://hessling-editor.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'regina-rexx-das')
provides=('hessling-editor')
options=(!buildflags)
source=("http://downloads.sourceforge.net/$provides/$_pkgname-$_pkgver.tar.gz")
sha512sums=('988c918dbb32177bfd5d28f251862060450f91a18e698bb4c19a20872738fec328b4b99c420f9755ef7401e6d3109664b6da5aa666115d6b30fdc1145d3ca1c6')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS
  ./configure --with-rexx=regina --with-curses=ncurses --prefix=/usr
  make the-con
  make the.man
  make THE_Help.txt
}

package(){
  make -C "$_pkgname-$_pkgver" DESTDIR=$pkgdir install
}
