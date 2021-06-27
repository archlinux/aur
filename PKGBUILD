# Maintainer: Achilleas Pipinellis <axilleas archlinux gr>

pkgname=python2-fswrap
_pkgname=fswrap
pkgver=1.0.0
pkgrel=1
pkgdesc="An opinionated wrapper on file system and path functions"
url="https://github.com/lakshmivyas/fswrap"
arch=('any')
license=('MIT')
makedepends=('python2' 'python2-setuptools')
source=(https://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz)

prepare() {
  cd ${srcdir}/$_pkgname-$pkgver
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' setup.py
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="${pkgdir}" -O1
}
md5sums=('edb6b6a3b456ff2ca46ad2e08e3218fa')
