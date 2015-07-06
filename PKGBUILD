# Maintainer: masutu <masutu dot arch at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>
_modulename=pyechonest
pkgname=python2-${_modulename}
pkgver=8.0.1
pkgrel=1
pkgdesc="An open source Python library for the Echo Nest API."
arch=('any')
url="https://github.com/echonest/${_modulename}"
license=('custom:BSD3')
depends=('python2')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/p/${_modulename}/${_modulename}-${pkgver}.tar.gz)
md5sums=('b097c886dafcf7c5e024818dba5b05d0')

package() {
  cd "$srcdir/${_modulename}-${pkgver}"
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
  python2 setup.py install --root="$pkgdir/" --optimize=1
#  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
