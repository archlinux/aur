# Maintainer: Axilleas P <axilleas archlinux info>

pkgname=python2-fswrap
_pkgname=fswrap
pkgver=0.1.2
pkgrel=1
pkgdesc="An opinionated wrapper on file system and path functions"
url="https://github.com/lakshmivyas/fswrap"
arch=('any')
license=('MIT')
makedepends=('python2' 'python2-distribute')
source=(http://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz)

prepare() {
  cd ${srcdir}/$_pkgname-$pkgver
  sed -i 's|#!python|#!/usr/bin/env python2|' distribute_setup.py
}

package() {
  cd ${srcdir}/$_pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python2 setup.py install --root="${pkgdir}" -O1
}
md5sums=('f0654c3c3277316f691af7339fdadfb3')
