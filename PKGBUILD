#Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
#Contributor: Dwight Schauer <dschauer@gmail.com>
#Contributor: GdelaRey <arch at delarey dot org>
#Maintainer: aksr <aksr at t-com dot me>
_pkgname=THE
pkgname=hessling-editor-das
pkgver=3.3RC7
pkgrel=1
pkgdesc="A powerful text editor modelled on the VM/CMS text editor XEDIT with the best features of Mansfield Software's Kedit."
arch=('i686' 'x86_64')
url="http://hessling-editor.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'regina-rexx-das')
provides=('hessling-editor')
options=(!buildflags)
source=("http://downloads.sourceforge.net/$provides/$_pkgname-$pkgver.tar.gz")
md5sums=('b0f94f20abd4153c08ac82b3caf8a7d3')
sha1sums=('4a1d48632ee01279805da9bf7dbb922e1118eb34')
sha256sums=('bba25b0f779b785c14c876eea11fd72debf104d20ba8e179ff12b06a970fc091')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  unset CFLAGS CXXFLAGS LDFLAGS
  ./configure --with-rexx=regina --with-curses=ncurses --prefix=/usr
  make the-con
  make the.man
  make THE_Help.txt
}

package(){
  make -C "$_pkgname-$pkgver" DESTDIR=$pkgdir install
}

