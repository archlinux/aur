# Maintainer: Sébastien Luttringer

pkgname=python2-pyev
pkgver=0.9.5
pkgrel=1
pkgdesc='Python2 libev interface'
arch=('i686' 'x86_64')
url='https://pypi.org/project/pyev-static'
license=('GPL')
makedepends=('python2-setuptools')
depends=('glibc' 'libev' 'python2')
source=("https://pypi.python.org/packages/source/p/pyev-static/pyev-static-$pkgver.tar.gz")
md5sums=('32b8925a25d4ef3f5c80f5b2f5250fd0')

build() {
  cd pyev-static-$pkgver
  python2 setup.py build
  find . -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

package() {
  cd pyev-static-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
