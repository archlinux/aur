# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=makoureactor
conflicts=('makoureactor-git')
pkgver=1.7.2
pkgrel=1
pkgdesc="Final Fantasy 7 Field Editor"
arch=('i686' 'x86_64')
url="https://github.com/myst6re/makoureactor"
license=('GPL3')
depends=('qt5-base' 'freeglut' 'zlib') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
source=("https://github.com/myst6re/makoureactor/archive/1.7.2.tar.gz")
md5sums=(4591a04e978e9b4138a154839120eb39)

build() {
  cd "makoureactor-1.7.2"
  qmake-qt5 Makou_Reactor.pro #Qt5 Build
  make
}

package(){
  cd "makoureactor-1.7.2"
  INSTALL_ROOT=$pkgdir make install
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/makoureactor
}
