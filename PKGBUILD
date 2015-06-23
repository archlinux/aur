# Maintainer: Oleg Plakhotniuk <olegus EIGHT AT gmail DOT com>
pkgname=trac-masterticketsplugin
pkgver=3.0.4
pkgrel=2
pkgdesc="Add support for ticket dependencies to Trac."
arch=('any')
url="http://trac-hacks.org/wiki/MasterTicketsPlugin"
license=('custom')
depends=('graphviz' 'ttf-font' 'trac>=0.12')
makedepends=('subversion' 'python2-setuptools')
source=(svn+https://trac-hacks.org/svn/masterticketsplugin/tags/mastertickets-$pkgver#revision=13608)
md5sums=('SKIP')

package() {
    cd "$srcdir/mastertickets-$pkgver"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
