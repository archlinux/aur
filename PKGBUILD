# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-reconfigure
_pkgname=reconfigure
pkgver=0.1.72
pkgrel=1
pkgdesc="An ORM for config files"
license=("LGPL3")
url="https://pypi.python.org/pypi/reconfigure"
depends=('python2-chardet')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/r/reconfigure/$_pkgname-$pkgver.tar.gz)
md5sums=('0228b8c1db5f1c848fa56dcf3cef8dd5')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/$_pkgname-$pkgver

  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  python2 setup.py install --root=$pkgdir
}
