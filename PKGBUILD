# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=picard-tools
pkgver=2.10.3
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=('any')
url="https://github.com/broadinstitute/picard"
license=('GPL2')
depends=('bash' 'java-runtime>=8')
source=("$pkgname-$pkgver.jar::https://github.com/broadinstitute/picard/releases/download/$pkgver/picard.jar"
        'picard-profile.sh'
        'picard.sh')
noextract=("$pkgname-$pkgver.jar")

package() {
  install -Dm755 $srcdir/picard-profile.sh    $pkgdir/etc/profile.d/picard.sh
  install -Dm755 $srcdir/picard.sh            $pkgdir/usr/bin/picard
  install -Dm755 $srcdir/$pkgname-$pkgver.jar $pkgdir/usr/share/java/picard-tools/picard.jar
}

md5sums=('ed8e29eca22f937c56d09c06d79ec762'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')
