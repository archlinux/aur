# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=legacybasic
_pkgname=LegacyBasic
pkgver=1.0.2
pkgrel=1
pkgdesc="BASIC interpreter for 1970s/80s BASIC games"
arch=('x86_64')
url="https://github.com/nigelperks/LegacyBasic"
license=('MIT' 'custom')
depends=('glibc')
makedepends=('make' 'gcc')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('17e58318259d2c6ab901710a44a83c8520620e98347ab44bb74fcdced01c0db8')

build() {
  cd "$_pkgname-$pkgver"
  make
}


package(){
  cd "$_pkgname-$pkgver"
  install -Dm755 bin/legacyBasic $pkgdir/usr/bin/$pkgname
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
