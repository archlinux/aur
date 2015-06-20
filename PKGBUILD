# Maintainer: josephgbr <rafael.f.f1@gmail.com>
pkgname=pyg3t
pkgver=0.3.1
pkgrel=1
pkgdesc="Python gettext Translation Toolkit"
arch=(any)
url="https://launchpad.net/pyg3t"
license=('GPL')
depends=('python2')
source=($url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('a05172b2988fd8a6ff1203c490b5217f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  sed -i "s#!/usr/bin/env python#&2#" \
        pyg3t/poabc.py pyg3t/podiff.py pyg3t/gtxml.py \
        pyg3t/gtgrep.py pyg3t/gtparse.py pyg3t/popatch.py

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
