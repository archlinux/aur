# Maintainer: Dennis Fink <dennis.fink@c3l.lu>

pkgname=python-hddtemp
_pkgname=hddtemp
pkgver=0.1.0
pkgrel=1
pkgdesc="Python library to parse hddtemp data"
arch=('any')
url="https://pypi.python.org/pypi/hddtemp"
license=('GPL3')
depends=('python')
source=(https://pypi.io/packages/source/h/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha512sums=('6e38de26b06a60089176fed29385a5370ed76cb79eccdeda9277fcd7ce16285dbc13e8493eb05cfbed0a991cabd837668ee6c1bdce4f304a6b2922e89d03990b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et; 
