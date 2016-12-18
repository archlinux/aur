# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-reconfigure
_pkgname=reconfigure
pkgver=0.1.79
pkgrel=2
pkgdesc="An ORM for config files"
license=("LGPL3")
url="https://pypi.python.org/pypi/reconfigure"
depends=("python2-chardet")
makedepends=("python2-setuptools")
source=(https://files.pythonhosted.org/packages/source/r/reconfigure/$_pkgname-$pkgver.tar.gz)
sha256sums=('35feed3dbc161ce84a469d782421cd543af0ec5c22f870949b0f61e7292484bd')
arch=("any")
options=(!emptydirs)

package() {
  cd $srcdir/$_pkgname-$pkgver

  find . -type f -exec sed -i \
    -e "1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "1s|^#!/usr/bin/python$|#!/usr/bin/env python2|" \
    "{}" \;

  python2 setup.py install --root=$pkgdir
}
