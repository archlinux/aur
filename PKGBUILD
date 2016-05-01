# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor
confilicts=makoureactor-git
pkgver=1.7.1
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt5-base' 'freeglut' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("https://github.com/myst6re/makoureactor/archive/1.7.1.tar.gz")
md5sums=(d84bbcf214e6c7fa42ea56383435bc62)

build() {
  cd "makoureactor-1.7.1"
  #qmake-qt4 Black_Chocobo.pro #Qt4 Build
  qmake-qt5 Makou_Reactor.pro #Qt5 Build
  make
}
package(){
  cd "makoureactor-1.7.1"
  INSTALL_ROOT=$pkgdir make install
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/makoureactor
  install -m666 vars.cfg "$pkgdir"/usr/share/makoureactor/
}  
