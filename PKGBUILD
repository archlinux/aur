# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=lingeling
pkgver=180517
_weirdver=bcj-78ebb86
pkgrel=1
pkgdesc="A BSP SAT solver derived from Picosat."
arch=('i686' 'x86_64')
url="http://fmv.jku.at/lingeling/"
license=('MIT')
depends=('glibc')
source=("http://fmv.jku.at/lingeling/lingeling-$_weirdver-$pkgver.tar.gz")
md5sums=('38d59b90298c1977039b34e85493f6aa')

build() {
  cd lingeling-$_weirdver-$pkgver
  # --static?  --aiger=<dir>?  --yalsat=<dir>?  --druplig=<dir>?
  ./configure.sh
  make
}

package() {
  cd lingeling-$_weirdver-$pkgver
  # no 'make install'
  install -Dm755 ilingeling  "$pkgdir/usr/bin/ilingeling"
  install -Dm755 lglddtrace  "$pkgdir/usr/bin/lglddtrace"
  install -Dm755 lglmbt      "$pkgdir/usr/bin/lglmbt"
  install -Dm755 lgluntrace  "$pkgdir/usr/bin/lgluntrace"
  install -Dm755 lingeling   "$pkgdir/usr/bin/lingeling"
  install -Dm755 plingeling  "$pkgdir/usr/bin/plingeling"
  install -Dm755 treengeling "$pkgdir/usr/bin/treengeling"

  install -Dm644 liblgl.a    "$pkgdir/usr/lib/liblgl.a"

  install -Dm644 COPYING     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
