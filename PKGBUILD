# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-ttfquery
pkgver=1.0.5
pkgrel=1
pkgdesc="FontTools-based package for querying system fonts"
arch=('any')
url="http://ttfquery.sourceforge.net/"
depends=('python2-fonttools' 'python2-numpy')
license=('BSD')
options=(!libtool)
source=(http://pypi.python.org/packages/source/T/TTFQuery/TTFQuery-${pkgver}.tar.gz)
md5sums=('6e01d38684eb94978fad70eba4c68463')

package() {
  cd "${srcdir}"/TTFQuery-${pkgver}

  export PYTHON=/usr/bin/python2
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

