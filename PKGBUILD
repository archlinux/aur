# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=patternutils
pkgver=0.0.1
pkgrel=1
pkgdesc="Combine regular expressions with template engines in a powerful matter"
arch=('any')
url="https://projects.metalgamer.eu/patternutils"
license=('GPL3')
makedpends=('python-setuptools')
depends=('python' 'python-click')
optepends=('python-jinja: Using jinja2 templates')
source=(https://download.metalgamer.eu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e1760de8fbac61face2f005f6e7f5cf923d218fe7e3824307402531ab7d9cf84f963ec61f398c975dd7fb241dc1e67a192bb7a2529a986f09eb681948397a394')

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et; 
