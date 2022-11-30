# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgbase=taxondna
pkgname=('sequencematrix' 'speciesidentifier' 'genbankexplorer')
pkg0=TaxonDNA
pkg1=SequenceMatrix
pkg2=SpeciesIdentifier
pkg3=GenBankExplorer
pkgver=1.9
pkgrel=6
depends=('java-runtime=11')
makedepends=('maven')
pkgdesc="Taxonomy-aware DNA sequence processing toolkit"
arch=('x86_64')
url="https://github.com/gaurav/taxondna"
license=('GPL2')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkg1,,}.desktop"
	"${pkg2,,}.desktop"
	"${pkg3,,}.desktop")
sha256sums=('54d6a2fdf4067e7f89fdeea971c44d5b938e44a495119807f0a9892af919e162'
            'f9b4e4eae5d8ef90b9dffe16209555773be8b0e111b9a69620b9be76604a73e4'
            '9ceb29dfe8bab70723a5876745f345e29ca7b37884da4f67b2dbe042cdc46fe3'
            '0b786535540f3adf3f979fb6af824238b2bd0f8bcb9c5721b0065bb35563e65d')
build () {
  cd $pkgbase-$pkgver
  mvn package
}
package_sequencematrix () {
  install -Dm755 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm755 ${srcdir}/$pkgbase-$pkgver/target/$pkg0-$pkgver-$pkg1.jar ${pkgdir}/usr/share/$pkgname/$pkgname.jar
}

package_speciesidentifier () {
 install -Dm755 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm755 ${srcdir}/$pkgbase-$pkgver/target/$pkg0-$pkgver-$pkg2.jar ${pkgdir}/usr/share/$pkgname/$pkgname.jar
}

package_genbankexplorer () {
  install -Dm755 ${srcdir}/$pkgname.desktop "${pkgdir}/usr/share/applications/$pkgname.desktop"
  install -Dm755 ${srcdir}/$pkgbase-$pkgver/target/$pkg0-$pkgver-$pkg3.jar ${pkgdir}/usr/share/$pkgname/$pkgname.jar
}
