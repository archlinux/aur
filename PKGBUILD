# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=fstar-bin
pkgver=0.9.5.0
pkgrel=1
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('x86_64')
depends=('z3')
provides=('fstar')
conflicts=('fstar' 'fstar-git')
source=("https://github.com/FStarLang/FStar/releases/download/v${pkgver}/fstar_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('be08677a370b8b43b14f3dc73f983582')

package() {
  cd "fstar"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r * $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
