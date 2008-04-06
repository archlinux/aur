pkgname=gtkmathview
pkgver=0.7.7
pkgrel=1
pkgdesc="C++ rendering engine for MathML documents"
arch=(i686 x86_64)
url="http://helm.cs.unibo.it/mml-widget/"
license=('GPL')
depends=('popt' 'gtk2' 't1lib' 'gmetadom>=0.2.4')
options=('nolibtool')
source=(http://helm.cs.unibo.it/mml-widget/sources/${pkgname}-${pkgver}.tar.gz)
md5sums=('1640c4b1df4565fa502e41a8e60e0d73')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
