# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=lingeling
pkgver=151109
pkgrel=1
pkgdesc="A BSP SAT solver derived from Picosat.  Academic use only."
arch=('i686' 'x86_64')
url="http://fmv.jku.at/lingeling/"
license=('custom')
depends=('glibc')
source=("http://fmv.jku.at/lingeling/lingeling-bal-2293bef-$pkgver.tar.gz")
md5sums=('ec8aa574c0efa8cae0adfe7ae9efd636')

build() {
  cd lingeling-bal-2293bef-$pkgver
  # --static?  --aiger=<dir>?  --yalsat=<dir>?  --druplig=<dir>?
  ./configure.sh
  make
}

package() {
  cd lingeling-bal-2293bef-$pkgver
  # no 'make install'
  install -Dm755 ilingeling " $pkgdir/usr/bin/ilingeling"
  install -Dm755 lglddtrace  "$pkgdir/usr/bin/lglddtrace"
  install -Dm755 lglmbt      "$pkgdir/usr/bin/lglmbt"
  install -Dm755 lgluntrace  "$pkgdir/usr/bin/lgluntrace"
  install -Dm755 lingeling   "$pkgdir/usr/bin/lingeling"
  install -Dm755 plingeling  "$pkgdir/usr/bin/plingeling"
  install -Dm755 treengeling "$pkgdir/usr/bin/treengeling"

  install -Dm644 liblgl.a "$pkgdir/usr/lib/liblgl.a" 

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
