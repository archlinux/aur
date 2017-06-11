# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=python2-reconfigure
pkgver=0.1.80
pkgrel=1
_pypi_path=89/10/d9853eb5d93bc145be5f4e18848a8cb6d85df00d4fc48de62b7f07a3c0d3
pkgdesc="An ORM for config files"
license=("LGPL3")
url="https://pypi.python.org/pypi/reconfigure"
depends=("python2-chardet")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/${_pypi_path}/reconfigure-${pkgver}.tar.gz")
md5sums=('44eb1589a10d4f2b8617ce8b1cc895d1')
arch=("any")
options=(!emptydirs)

package() {
  cd $srcdir/reconfigure-$pkgver

  find . -type f -exec sed -i \
    -e "1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "1s|^#!/usr/bin/python$|#!/usr/bin/env python2|" \
    "{}" \;

  python2 setup.py install --root=$pkgdir
}
