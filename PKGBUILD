# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=macse
pkgver=2.07
pkgrel=1
pkgdesc="Multiple Alignment of Coding SEquences Accounting for Frameshifts and Stop Codons"
arch=('any')
url="https://www.agap-ge2pop.org/macse/"
license=('custom:unknown')
makedepends=('java-runtime' 'bash')
source=(https://www.agap-ge2pop.org/wp-content/uploads/macse/releases/macse_v${pkgver}.jar)
noextract=("macse_v${pkgver}.jar")
sha256sums=('96873a1465f1e1aa9d0c462d469eee6954d36e8639727f69f34a72fcb6583963')
# no source code
package(){
  cd $srcdir
  install -Dm755 ${pkgname}_v${pkgver}.jar $pkgdir/usr/share/java/$pkgname.jar
  echo "java -jar /usr/share/java/$pkgname.jar \$@" > ${pkgname}-bin
  chmod +x ${pkgname}-bin
  install -Dm755 ${pkgname}-bin $pkgdir/usr/bin/$pkgname

  echo "Unknown License" > license
  install -Dm644 license $pkgdir/usr/share/licenses/$pkgname/license  
}
