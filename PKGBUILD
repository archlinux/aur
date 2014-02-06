# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.9.1
pkgrel=1
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='http://mg.pov.lt/gtimelog/'
license=('GPL')
depends=('python2' 'python2-gobject' 'python2-setuptools')
source=(http://pypi.python.org/packages/source/g/$pkgname/$pkgname-${pkgver}.tar.gz)
md5sums=('5e95d0e968ad24778e0ae9fee748d73f')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"

  sed -i 's/env python/env python2/g' \
      "$pkgdir"/usr/lib/python2.7/site-packages/gtimelog/main.py
}
