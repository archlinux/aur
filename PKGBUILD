# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Kevin Puertas <kevinpr at jkanetwork dot com>
# Contributor: St.kai <St.kai@live.cn>
# Contributor: ssysmso sending updated PKGBUILD
# Contributor: Christoph Korn <christoph.korn at posteo dot de>

pkgname=beebeep
pkgver=5.8.4
pkgrel=5
pkgdesc='Secure LAN messenger and file sender'
arch=('x86_64')
url='https://www.beebeep.net/'
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-code-$pkgver.zip"
        'install-target.patch')
sha256sums=('43e65a9d5249385fde782907d0cc3e26d6dd435bb623bcc0f93499055988f04c'
            '35f28432630bd9cf7ca3d99e33454cafe6e8127ef9d0935071f587ddb062269d')
 
prepare() {
  cd $pkgname-code-r*
  patch -Np0 -i ../install-target.patch
}
 
build() {
  cd $pkgname-code-r*
  qmake-qt5 PREFIX=/usr
  make
}
 
package(){
  cd $pkgname-code-r*
  make INSTALL_ROOT="$pkgdir" install
}
