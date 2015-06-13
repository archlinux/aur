# Maintainer: Thaodan <theodorstormgrade@gmail.com>

pkgname=qremotecontrol-server
_pkgname=qremotecontrol
pkgver=2.4.1
pkgrel=1
pkgdesc="QRemoteControl is a remote control application for your mobile phone. This is the server part of QRemoteControl."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php?content=150421"
license=('GPL')
depends=('qt4')
#makedepends=('qmake')
source=("http://sourceforge.net/projects/qrc/files/$pkgver/qremotecontrol-$pkgver.tar.bz2") 
md5sums=('d983adcfc471c44edab8d53964fe9489')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  qmake-qt4
}
build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make   CXXFLAGS+="$CXXFLAGS -W -D_REENTRANT \$(DEFINES)" LDFLAGS+="$LDFLAGS"
}




package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
