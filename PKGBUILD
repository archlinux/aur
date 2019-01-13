# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.9.91
pkgrel=2
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'openssl') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/archive/v1.9.91.tar.gz")
sha256sums=('37abc85e2d7e0cce8aa8bdc81ca14682c69da0eda36a4d9bd339b851fffab09b')

build() {
  cd "blackchocobo-1.9.91"
  qmake-qt5 Black_Chocobo.pro #Qt5 Build
  make
}
package(){
  cd "blackchocobo-1.9.91"
  INSTALL_ROOT=$pkgdir make install 
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/blackchocobo
  install -D -m644 debian/blackchocobo.sharedmimeinfo "$pkgdir"/usr/share/mime/blackchocobo.xml
}  
