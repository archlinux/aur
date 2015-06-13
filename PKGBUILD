#Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=yokadi
pkgver=0.14.0
pkgrel=1
pkgdesc="Not your grandma TODO list"
url="http://yokadi.github.io"
arch=('any')
depends=('python2-sqlobject' 'python2-dateutil' 'python2-crypto' 'hicolor-icon-theme')
install=$pkgname.install
source=("$url/download/$pkgname-$pkgver.tar.bz2")
license=('GPL3')
md5sums=('c6b300aa478adde6012bc35bad5a8a4f')

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' \
    yokadi/{createdemodb.py,yokadid.py,ycli/main.py,tests/tests.py,core/daemon.py} \
    update/{update*,dump.py}
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

