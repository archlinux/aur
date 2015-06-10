#Maintainer: Carlos Franke <carlos_franke at lemtank dot de>
#Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=bdflib
pkgname=python2-$_pkgname
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
url="http://gitorious.org/bdflib"
arch=('any')
license=('GPL2')
depends=('python2')
conflicts=("bdflib-git")
provides=("bdflib-git")
options=(!emptydirs)
source=('https://pypi.python.org/packages/source/b/bdflib/bdflib-v1.0.0.tar.gz')
md5sums=('0de53859b2420e51169c349657f2ee97')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

