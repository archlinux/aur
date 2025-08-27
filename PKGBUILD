# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Kevin Puertas <kevinpr at jkanetwork dot com>
# Contributor: St.kai <St.kai@live.cn>
# Contributor: ssysmso sending updated PKGBUILD
# Contributor: Christoph Korn <christoph.korn at posteo dot de>

pkgname=beebeep
pkgver=5.8.6
pkgrel=2
pkgdesc='Secure LAN messenger and file sender'
arch=('x86_64')
url='https://www.beebeep.net/'
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-code-$pkgver.zip"
        'install-target.patch')
sha256sums=('44994daf35c042aa1f023ad95c2fa17c2c652da5d4584ca547b1bbc2ed916248'
            'f6dd4cc2c797a9b21bee292f8adba563abff22b4065a22266fbd37efd96a5071')
 
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
