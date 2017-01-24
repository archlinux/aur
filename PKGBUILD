# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=picard-tools
pkgver=2.8.2
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=('any')
url="https://github.com/broadinstitute/picard"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("https://github.com/broadinstitute/picard/releases/download/$pkgver/picard-$pkgver.jar"
        'picard-profile.sh'
        'picard.sh')
noextract=("picard-$pkgver.jar")

package() {
  install -Dm755 $srcdir/picard-profile.sh  $pkgdir/etc/profile.d/picard.sh
  install -Dm755 $srcdir/picard.sh          $pkgdir/usr/bin/picard
  install -Dm755 $srcdir/picard-$pkgver.jar $pkgdir/usr/share/java/picard-tools/picard.jar
}

md5sums=('c0973d1e403927e426448e7769bd2d01'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')
