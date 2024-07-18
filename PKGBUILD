# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=iC10TrainingData
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Training Datasets for iC10 Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d470ffcb9f48eeab146312127c93d028')
b2sums=('bd295892bbf4e422bdc53d5bbb70c730b4512ec2d38b61e4ee25e11ab3aef1f12a3f651471630c8b2b0448763f96765173a1c6be84deeca973ad7fd35acff84d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
