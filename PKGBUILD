# Contributor: Gicu Gorodenco <cyclopsihus@gmail.com>
pkgname=qpitch
pkgver=1.0.1
pkgrel=3
pkgdesc="QPitch is a program to tune a musical instrument using your computer and its microphone or line-in input."
arch=('i686' 'x86_64')
url="http://wspinell.altervista.org/qpitch/"
license=('LGPL')
depends=(qt4 portaudio fftw)
source=(http://download.gna.org/qpitch/releases/$pkgname-$pkgver.tar.gz qpitch_logo.xpm qpitch.desktop)
md5sums=('36d5f317045d6a854a98bd4913020c7a' '8a3cadc0c9c98f1213670d1316e945e5' '9068aafb48ff21a6ac6990012abbef5d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/src
  qmake-qt4 qpitch.pro
  make
}

package() {
  install -D -m 755 ${srcdir}/${pkgname}-${pkgver}/src/qpitch ${pkgdir}/usr/bin/qpitch
  install -D -m 644 ${srcdir}/qpitch_logo.xpm ${pkgdir}/usr/share/icons/hicolor/32x32/apps/qpitch_logo.xpm
  install -D -m 644 ${srcdir}/qpitch.desktop ${pkgdir}/usr/share/applications/qpitch.desktop
}
