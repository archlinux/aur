# $Id: PKGBUILD,v 1.7 2005/07/16 10:35:41 tpowa Exp $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=mp3splt
pkgver=2.1c
pkgrel=2
pkgdesc="Comandline tool for splitting mp3 and ogg files without decoding"
url="http://mp3splt.sourceforge.net"
depends=('libmad' 'libvorbis')
source=(http://belnet.dl.sourceforge.net/sourceforge/mp3splt/mp3splt-$pkgver-src.tar.gz mp3splt-gcc4.patch)

build() {
  cd $startdir/src/mp3splt-$pkgver
  patch -Np0 -i ../mp3splt-gcc4.patch
  ./configure --prefix=/usr
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
        for bin in mp3splt; do
                install -D -m755 $bin $startdir/pkg/usr/bin/$bin
        done
        install -D -m644 mp3splt.1 $startdir/pkg/usr/man/man1/mp3splt.1
}

md5sums=('b355835e4d57b8b921a14a6485244c87' '09e08026cd98cba4bd3f0d74951ef231')
