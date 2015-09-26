# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
pkgname=samsung-ml1640
pkgver=3.00.65
pkgrel=3
pkgdesc="Samsung ML-1640 CUPS driver"
arch=('i686' 'x86_64')
depends=('cups' 'ghostscript')
conflicts=('samsung-printers')
license='custom:samsung'
url="http://www.samsung.com"
source=("http://org.downloadcenter.samsung.com/content/DR/200911/20091118145015140/UnifiedLinuxDriver_1.01.tar.gz")
md5sums=('b03b7feaf54624a6d07ea3832889fdbc')

package() {
  mkdir -p "$pkgdir/usr/share/cups/model/"
  mkdir -p "$pkgdir/usr/lib/cups/filter/"
 
  install -m 644 -D "$srcdir/cdroot/Linux/noarch/at_opt/share/ppd/ML-1640spl2.ppd" "$pkgdir/usr/share/cups/model/ML1640.ppd"
 
  if [[ "$CARCH" == "x86_64" ]]; then
    install -m 755 -D "$srcdir/cdroot/Linux/x86_64/at_root/usr/lib64/cups/filter/rastertosamsungspl" "$pkgdir/usr/lib/cups/filter/rastertosamsungspl"
  else
    install -m 755 -D "$srcdir/cdroot/Linux/i386/at_root/usr/lib/cups/filter/rastertosamsungspl" "$pkgdir/usr/lib/cups/filter/rastertosamsungspl"
  fi
}
