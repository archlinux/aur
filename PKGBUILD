# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttm
pkgver=4.05
pkgrel=2
pkgdesc="TeX to MathML translator"
url="http://hutchinson.belmont.ma.us/tth/"
arch=('i686' 'x86_64')
optdepends=('tth: for providing some scripts ttm could also use')
license=('GPL')
source=($pkgname-$pkgver.tar.gz::http://hutchinson.belmont.ma.us/tth/mml/ttmC.tar.gz)
sha256sums=('7023abe91e924c6f29f89546079b5f4aa8a27ae9d424c125bff13481d53c3804')

build() {
  cd ttmC
  gcc -o ttm ttm.c 
}

package() {
  cd ttmC
  install -D -m755 ttm "$pkgdir"/usr/bin/ttm
  install -D -m644 ttm_manual.html \
    "$pkgdir"/usr/share/doc/ttm/ttm_manual.html 
  install -D -m644 README "$pkgdir"/usr/share/doc/ttm/README
}
