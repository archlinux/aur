# Maintainer: Chris Rizzitello <sithlord48@gmail.com>
pkgname=blackchocobo
conflicts=('blackchocobo-git')
pkgver=1.9.91
pkgrel=1
pkgdesc="Final Fantasy 7 Save Editor"
arch=('i686' 'x86_64')
url="http://www.blackchocobo.com/"
license=('GPL3')
depends=('qt5-base' 'openssl') #Qt5)
#optdepends=('otf-ipafont: font for displaying japanese')
install=$pkgname.install
source=("https://github.com/sithlord48/blackchocobo/releases/download/v1.9.91/blackchocobo-1.9.91.tar.gz")
sha256sums=('d7d7be5db34c18368a39455f5f45f97bc234744702b899c81b32a0f1ee4768b6')

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
