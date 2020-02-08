# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.10.0
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base')
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/archive/v1.10.0.tar.gz")
sha256sums=('77b5dcf0dba8f16b436155ee1e7158ef5a9a72d9b62e0e29f12577fb45439a36')

build() {
  cd "blackchocobo-1.10.0"
  qmake-qt5 Black_Chocobo.pro #Qt5 Build
  make
}
package(){
  cd "blackchocobo-1.10.0"
  INSTALL_ROOT=$pkgdir make install 
  install -D -m644 debian/menu "$pkgdir"/usr/share/menu/blackchocobo
  install -D -m644 debian/blackchocobo.sharedmimeinfo "$pkgdir"/usr/share/mime/blackchocobo.xml
}  
