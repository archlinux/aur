# Contributor: James Thomas <dairy_water at yahoo dot co dot uk>
pkgname=epubcheck
pkgver=4.0.1
pkgrel=1
pkgdesc="A tool to validate IDPF Epub files."
arch=(any)
url="https://github.com/IDPF/epubcheck"
license=('BSD')
groups=(inform)
depends=('java-environment')
makedepends=('gzip')
source=(https://github.com/IDPF/epubcheck/releases/download/v${pkgver}/${pkgname}-${pkgver}.zip)    
md5sums=('e5834be417b8e9ddcdb1498929ecd41e')

package() {
    mkdir -p $pkgdir/usr/share/${pkgname}
    mkdir -p $pkgdir/usr/bin
    
    cp -fr $srcdir/${pkgname}-${pkgver}/* $pkgdir/usr/share/${pkgname}
	
    echo "java -jar /usr/share/epubcheck/epubcheck.jar \"\$1\"" > $pkgdir/usr/bin/${pkgname}
	
    chmod +x $pkgdir/usr/bin/${pkgname}
  
    install -D -m0644 $pkgdir/usr/share/epubcheck/licenses/BSD-3-Clause.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

