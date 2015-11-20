# Maintainer: Sedeer el-Showk <s.elshowk@netherrealm.net>

pkgname=fastqc
pkgver=0.11.4
pkgrel=2
pkgdesc='A quality control tool for high throughput sequence data.'
arch=('any')
url="http://www.bioinformatics.babraham.ac.uk/projects/fastqc"
license=('GPL3')
depends=('perl' 'java-environment>=6')
source=("http://www.bioinformatics.babraham.ac.uk/projects/$pkgname/${pkgname}_v$pkgver.zip")
md5sums=('104ff2e0e9aebf5bee1f6b068a059b0d')

package() {
  mkdir $pkgdir/opt/
  cp -r $srcdir/FastQC/ $pkgdir/opt/

  mkdir -p "${pkgdir}/usr/bin/"
  chmod 755 $pkgdir/opt/FastQC/fastqc
  ln -s "/opt/FastQC/fastqc" "${pkgdir}/usr/bin/"

  mkdir -p ${pkgdir}/usr/share/man/man1/
  sed -e '1,/__DATA__/d' $srcdir/FastQC/fastqc | tail -n +2 > ${pkgdir}/usr/share/man/man1/fastq.1
}
