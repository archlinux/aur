# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=mitogeneextractor
_pkgname=MitoGeneExtractor
pkgver=1.9.5
pkgrel=1
pkgdesc="extract protein coding mitochondrial genes https://doi.org/10.1111/2041-210X.14075"
arch=('x86_64')
url="https://github.com/cmayer/MitoGeneExtractor"
license=('GPL-3.0-or-later')
depends=('exonerate')
makedepends=('make')
source=($url/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('19536a464e95ab66756ce0a7252455ad76a68c6b8c385fe2b462935b226949da')
build() {
  cd "$_pkgname-$pkgver"
  make
}

package(){
  cd "$_pkgname-$pkgver"
  install -Dm755 "$_pkgname-v$pkgver" "$pkgdir/usr/bin/$_pkgname"
}
