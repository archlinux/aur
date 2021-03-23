# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='outspline-extra'
pkgver='0.8.2'
pkgrel=2
pkgdesc="Extra addons for Outspline"
arch=('any')
url="https://kynikos.github.io/outspline/"
license=('GPL3')
depends=('outspline')
source=("https://downloads.sourceforge.net/project/outspline/extra/$pkgname-$pkgver.tar.bz2")
sha256sums=('8b5db75639de3cb462d9f138e1f775b395c1a76fa9ac84d77b3a6bc6dc55cc02')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/plugins/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/components/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/info/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/info/plugins/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/conf/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/conf/plugins/__init__.py{,c,o}
    rm $pkgdir/usr/lib/python2.7/site-packages/outspline/dbdeps/__init__.py{,c,o}
}
