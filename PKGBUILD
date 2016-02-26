# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
confilicts=('blackchocobo-git')
pkgver=1.9.90
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'openssl') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/archive/v1.9.90.tar.gz")
md5sums=('03a4eec9c2d3e2fbaeba3a241a422805')

build() {
  cd "blackchocobo-1.9.90"
  qmake-qt5 Black_Chocobo.pro #Qt5 Build
  make
}
package(){
  cd "blackchocobo-1.9.90"
  INSTALL_ROOT=$pkgdir make install 
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/blackchocobo
  install -D -m644 debian/blackchocobo.sharedmimeinfo "$pkgdir"/usr/share/mime/blackchocobo.xml
}  
