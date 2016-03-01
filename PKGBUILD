# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Dariusz 'quasi' Panchyrz <quasi@aur.archlinux.org>

pkgname=conlie
pkgver=2.2.2
pkgrel=2
pkgdesc="A Computer algebra package for Lie group computations"
arch=('i686' 'x86_64')
url="http://www-math.univ-poitiers.fr/~maavl/LiE/"
license=('LGPL')
depends=('sh')
install="$pkgname.install"
source=("http://www-math.univ-poitiers.fr/~maavl/LiE/conLiE.tar.gz" 'lie' 'lie.1')
md5sums=('2e98f252364d43557a322ea7eb677944'
         'd4f5ad8b87479ef93734eee6d1629190'
         'a47060395617ed656eaccde1a9e9ee93')

build() {
  cd LiE

  make
}

package() {
  cd LiE

  install -D Lie.exe $pkgdir/usr/bin/Lie.exe
  install -D $srcdir/lie $pkgdir/usr/bin/lie

  mkdir -p $pkgdir/usr/lib/lie
  for i in INFO.* LEARN.ind
  do
      cp $i $pkgdir/usr/lib/lie/
  done

  install -D manual/manual.dvi $pkgdir/usr/share/doc/lie/manual.dvi
  install -D README $pkgdir/usr/share/doc/lie-2.2.2/README

  install -D $srcdir/lie.1 $pkgdir/usr/share/man/man1/lie.1
}
