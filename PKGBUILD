# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-catcher
_name=python-catcher
pkgver=0.1.7
pkgrel=2
pkgdesc="Beautiful stack traces for Python"
license=("PSF")
url="https://pypi.python.org/pypi/python-catcher"
depends=('python2-requests' 'python2-mako')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/p/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('eecb82153f46586841162613008bab47')
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/python-catcher-$pkgver

  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  python2 setup.py install --root=$pkgdir
}
