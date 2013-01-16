# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=gtimelog
pkgver=0.8.0
pkgrel=1
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='http://mg.pov.lt/gtimelog/'
license=('GPL')
depends=('python2' 'python2-gobject' 'python2-distribute')
source=(http://pypi.python.org/packages/source/g/$pkgname/$pkgname-${pkgver}.tar.gz)
md5sums=('8a66f515d1e378f98d56038633052e55')

package() {
    cd "$srcdir"/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir"

    sed -i 's/env python/env python2/g' \
        "$pkgdir"/usr/lib/python2.7/site-packages/gtimelog/main.py \
        "$pkgdir"/usr/lib/python2.7/site-packages/gtimelog/test_gtimelog.py
}
