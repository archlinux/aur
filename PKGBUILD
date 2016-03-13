# Maintainer: Mort Yao <soimort@Verlangen>

pkgname=fstar-bin
pkgver=0.9.2.0
pkgrel=1
pkgdesc='A Higher-Order Effectful Language Designed for Program Verification'
url='https://fstar-lang.org/'
license=('Apache')
arch=('x86_64')
depends=('z3')
provides=('fstar')
conflicts=('fstar' 'fstar-git')
source=("https://github.com/FStarLang/FStar/releases/download/v${pkgver}/fstar_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('60962bd46b87c68ec07dd50cba652e29')

package() {
  cd "fstar"

  install -d -m755 $pkgdir/opt/fstar $pkgdir/usr/bin
  cp -r bin/ doc/ examples/ lib/ $pkgdir/opt/fstar
  ln -s /opt/fstar/bin/fstar.exe $pkgdir/usr/bin/fstar
}
