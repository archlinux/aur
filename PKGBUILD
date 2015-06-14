# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='outspline-extra'
pkgver='0.8.1'
pkgrel=1
pkgdesc="Extra addons for Outspline"
arch=('any')
url="https://kynikos.github.io/outspline/"
license=('GPL3')
depends=('outspline')
source=("http://downloads.sourceforge.net/project/outspline/extra/$pkgname-$pkgver.tar.bz2")
sha256sums=('164fa3d80087855e177e366697d48393605f986cfbb96f8036146b19f8f02759')

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
