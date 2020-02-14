# Contributor: Jordi Cerdan (jcerdan) <jcerdan@tecob.com>
pkgname=drpython
pkgver=3.11.4
pkgrel=2
pkgdesc="Python IDE built with wxWidgets"
url="http://drpython.sourceforge.net/"
license=('GPL')
depends=('wxpython')
optdepends=("python2-docs: Python documentation")
arch=('any')
source=("http://downloads.sourceforge.net/sourceforge/drpython/DrPython%20%283.x%29/$pkgver/DrPython_$pkgver.zip" 'drpython.sh' 'drpython.desktop')
sha512sums=('13943eb28d7155e99e0ffb57903ddde25c964c908ac848f14041c456bc6aa71bab7cad1101e489c09ba5efb5af35e33895a518021bb607f5047844927bcebf2b'
            '565512c83b10ec371b6d5d9c279c875e9dd0bd50480a246f8cbe905181d83686a3230f61fe41f1fffb0ac17d0b07c2a7b7311de8b27e91bc9a3f88f44328e7b8'
            '06f375050c07f19a94b195b3ecaeb786b16ffb7ef22a1d01330d625153e2de3a6caa015d5ec71abd36c4d80e4a39926e65cb11f3907c9c69c4b7fa522bc8318d')

package() {
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -r $srcdir/DrPython/* $pkgdir/usr/share/$pkgname/
    find $pkgdir -name "*.py" -exec \
      sed -i '1s/python[[:space:]]*$/python2/' {} \;
    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
