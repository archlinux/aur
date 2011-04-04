# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: JJDaNiMoTh <jjdanimoth@gmail.com>

pkgname=qmc2
pkgver=0.2.b19
pkgrel=1
pkgdesc="Qt 4 based UNIX MAME frontend supporting SDLMAME."
url="http://qmc2.arcadehits.net"
license=("GPL")
arch=('i686' 'x86_64')
depends=('qt' 'phonon' 'sdl' 'libxmu')
makedepends=('rsync' 'mesa')
source=("http://downloads.sourceforge.net/project/qmc2/qmc2/$pkgver/qmc2-$pkgver.tar.bz2")
md5sums=('b9cae829540066d21154e474b24ccc62')

build() {
  cd "$srcdir/$pkgname"
  export CTIME=0
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr
  make PREFIX=/usr DATADIR=/usr/share SYSCONFDIR=/etc QTDIR=/usr DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -D -m644 "$srcdir/qmc2/data/img/mame.png" "$pkgdir/usr/share/pixmaps"
}
