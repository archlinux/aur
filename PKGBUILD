# $Id: PKGBUILD,v 1.3 2004/09/03 10:13:57 tpowa Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>


pkgname=mp3wrap
pkgver=0.5
pkgrel=1
pkgdesc="Tool for wrapping mp3 files --- free independent alternative to AlbumWrap"
url="http://mp3wrap.sourceforge.net"
depends=('glibc')
source=(http://belnet.dl.sourceforge.net/sourceforge/mp3wrap/mp3wrap-$pkgver-src.tar.gz)

build() {
  cd $startdir/src/mp3wrap-$pkgver
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
        for bin in mp3wrap; do
                install -D -m755 $bin $startdir/pkg/usr/bin/$bin
        done
        install -D -m644 mp3wrap.1 $startdir/pkg/usr/man/man1/mp3wrap.1

}
md5sums=('096b46295cbe3ee2f02ca7792517dc36')

