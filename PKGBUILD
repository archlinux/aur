# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=fastuniq
_pkgname=FastUniq
pkgver=1.1
pkgrel=1
pkgdesc="ultrafast de novo tool for removal of duplicates in paired
short DNA sequence reads in FASTQ format \
	 https://doi.org/10.1371/journal.pone.0052249"
arch=('x86_64')
url="https://sourceforge.net/projects/fastuniq/"
license=('LicenseRef-unknown')
depends=('glibc')
makedepends=('make')
source=($pkgname-$pkgver.tar.gz::https://sourceforge.net/projects/fastuniq/files/FastUniq-${pkgver}.tar.gz/download)
sha256sums=('9ebf251566d097226393fb5aa9db30a827e60c7a4bd9f6e06022b4af4cee0eae')

build() {
  cd $srcdir/$_pkgname/source
  make
}

package() {
  cd $srcdir/$_pkgname
  install -Dm 644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt	  
  cd $srcdir/$_pkgname/source
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
