# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

pkgname=legacybasic
_pkgname=LegacyBasic
pkgver=3.1.1
pkgrel=1
pkgdesc="BASIC interpreter for 1970s/80s BASIC games"
arch=('x86_64')
url="https://github.com/nigelperks/LegacyBasic"
license=('MIT' 'custom')
depends=('glibc')
makedepends=('make' 'gcc' 'cmake')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('a853bb0a9b23dba32b93521c069c791584ae5a5dddde4b4d520b4a3be83b900f')

build() {
  cd "$_pkgname-$pkgver"
  mkdir Release
  cmake -S . -B Release -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
  cmake --build Release
}


package(){
  cd "$_pkgname-$pkgver"
  cmake --install Release --prefix $pkgdir/usr
}
