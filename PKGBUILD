# Maintainer: M0Rf30

pkgname=libshout-idjc-git
pkgver=878.896a7d2
pkgrel=1
pkgdesc="Libshout plus some extensions for IDJC."
arch=(i686 x86_64)
url="http://idjc.sourceforge.net/"
depends=('libvorbis' 'libtheora' 'speex' 'twolame')
makedepends=('git')
options=('!libtool' '!emptydirs')
source=('libshout-idjc::git://idjc.git.sourceforge.net/gitroot/idjc/idjc/')
license=('LGPL')

build()
{
  cd libshout-idjc/libshout-idjc
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd libshout-idjc/libshout-idjc
  make DESTDIR="${pkgdir}" install
  rm -f ${pkgdir}/usr/share/aclocal/shout.m4
}

pkgver() {
  cd libshout-idjc
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
