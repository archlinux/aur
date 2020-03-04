# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Kory Woods <kory _at_ virlo >dot< net>
# Contributor: Aleix Pol <aleixpol@kde.org>

pkgname=miranda
pkgver=2.066
pkgrel=1
pkgdesc='Miranda programming language'
url='http://miranda.org.uk/'
license=('custom')
arch=('x86_64')
source=("https://www.cs.kent.ac.uk/people/staff/dat/miranda/src/mira-2066-src.tgz")
md5sums=('bd3f5b79b0f46ffeb867d26a5266f0f7')

build() {
  cd $pkgname

  make cleanup
  make
}

package() {
  cd $pkgname

  make -s all
  install -Dm755 mira $pkgdir/usr/bin/mira
  install -Dm755 mira.1 $pkgdir/usr/share/man/man1/mira.1
  mkdir -p  $pkgdir/usr/lib/miralib
  cp -r miralib/ $pkgdir/usr/lib/
}
