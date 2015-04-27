# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=eg
pkgver=0.0.3
pkgrel=1
pkgdesc="Useful examples at the command line"
license=("MIT")
url="https://github.com/srsudar/eg"
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/srsudar/eg/archive/v${pkgver}.tar.gz")
arch=('any')
options=(!emptydirs)

package() {
  cd $srcdir/$pkgname-$pkgver

  find . -type f -exec sed -i \
    -e'1s|^#!/usr/bin/env python$|#!/usr/bin/env python2|' \
    -e '1s|^#!/usr/bin/python$|#!/usr/bin/env python2|' \
    "{}" \;

  python2 setup.py install --root=$pkgdir
}

sha256sums=('c257e334f2a2e494f9b9791b92c1d3f7b00da3e2e7ec47f02d720342b466f968')
