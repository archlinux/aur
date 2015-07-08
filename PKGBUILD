# Contributor: Jordi Cerdan (jcerdan) <jcerdan@tecob.com>
pkgname=drpython
pkgver=3.11.3
pkgrel=2
pkgdesc="Python IDE built with wxWidgets"
url="http://drpython.sourceforge.net/"
license=('GPL')
depends=('wxpython')
optdepends=("python2-docs: Python documentation")
arch=('any')
source=("http://downloads.sourceforge.net/sourceforge/drpython/DrPython%20Current/$pkgver/DrPython_$pkgver.zip" 'drpython.sh' 'drpython.desktop')
md5sums=('eb59cf61d840af274d2940ce1a3c2bd4' '4301f6421351e0632cf2d4f8f373616f' '171d08cdc4f3cc429c60d70a5e4e5e3e')

package() {
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -r $srcdir/DrPython/* $pkgdir/usr/share/$pkgname/
    find $pkgdir -name "*.py" -exec \
      sed -i '1s/python[[:space:]]*$/python2/' {} \;
    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
