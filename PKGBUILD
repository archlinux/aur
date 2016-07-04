# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=picard-tools
pkgver=2.5.0
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=('any')
url="https://github.com/broadinstitute/picard"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("https://github.com/broadinstitute/picard/releases/download/$pkgver/$pkgname-$pkgver.zip"
        'picard-profile.sh'
        'picard.sh')
md5sums=('0b9e2c9dc0043b5f8ef7b8f9b39780ae'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')

package() {
  cd $srcdir/$pkgname-$pkgver

  for f in *.jar ; do
    install -Dm755 $f $pkgdir/usr/share/java/picard-tools/$f
  done

  install -Dm755 $srcdir/picard.sh         $pkgdir/usr/bin/picard
  install -Dm755 $srcdir/picard-profile.sh $pkgdir/etc/profile.d/picard.sh
}
