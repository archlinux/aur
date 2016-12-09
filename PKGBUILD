# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=picard-tools
pkgver=2.8.0
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=('any')
url="https://github.com/broadinstitute/picard"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("picard-$pkgver.jar::https://github.com/broadinstitute/picard/releases/download/$pkgver/picard.jar"
        'picard-profile.sh'
        'picard.sh')
noextract=("picard-$pkgver.jar")
md5sums=('8aaa57d963993b8e0a0fc1999ca9ff6c'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')

package() {
  install -Dm755 $srcdir/picard-profile.sh  $pkgdir/etc/profile.d/picard.sh
  install -Dm755 $srcdir/picard.sh          $pkgdir/usr/bin/picard
  install -Dm755 $srcdir/picard-$pkgver.jar $pkgdir/usr/share/java/picard-tools/picard.jar
}
