# Maintainer: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=gblocks
_pkgname=Gblocks
provides=("gblocks")
pkgver=1.0
pkgrel=1
pkgdesc="A program written in ANSI C language that eliminates poorly aligned \
	 positions and divergent regions of an alignment of DNA or protein sequences. https://doi.org/10.1093/oxfordjournals.molbev.a026334"
url='https://www.biologiaevolutiva.org/jcastresana/Gblocks.html'
arch=('x86_64')
license=('unknown')
depends=('glibc')
makedepends=('tar')
source=("https://molevol-ibe.csic.es/${_pkgname}/${_pkgname}_${pkgver}_Linux.tar.gz")
sha256sums=('e899015c8c6583fd6c6799539af31d55a108d7d951c992930f8c452cca371c89')

prepare() {
  tar -xvf ${_pkgname}_${pkgver}_Linux.tar
}

package() {
  install -Dm755 ${_pkgname}_${pkgver}_Linux/$_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 ${_pkgname}_${pkgver}_Linux/Documentation/Gblocks_documentation.html  $pkgdir/usr/share/doc/$_pkgname/Gblocks_documentation.html
}
