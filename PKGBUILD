# Maintainer: Luis Falcon <falcon at gnuhealth dot org>
# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=mygnuhealth
_pkgname=mygnuhealth
_name=MyGNUHealth
pkgver=1.0.1
pkgrel=1
pkgdesc="The GNU Health Personal Health Record (PHR)"
arch=('any')
url="https://www.gnuhealth.org"
license=('GPL3')
depends=('python' 'python-matplotlib' 'python-requests' 'python-tinydb' 'python-bcrypt' 'pyside2' 'kirigami2')
makedepends=('python-setuptools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1a77c087572a9c1e24d3b63d64ecca19f74b58aecc9ea2555c73d168e14be9b0')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
