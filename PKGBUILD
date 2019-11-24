# Maintainer: TheAifam5 <theaifam5@gmail.com>

pkgname=python-marshmallow2
pkgver=2.20.5
pkgrel=1
pkgdesc="A lightweight library for converting complex datatypes to and from native Python datatypes."
url="https://github.com/marshmallow-code/marshmallow"
license=('MIT')
arch=('any')
depends=('python')
provides=('python-marshmallow')
conflicts=('python-marshmallow')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-simplejson' 'python-pytz' 'python-dateutil')
source=("https://pypi.io/packages/source/m/marshmallow/marshmallow-$pkgver.tar.gz")
sha512sums=('a02b6a3341d2cd08174937112eba2f69a07de59054a088eef64ac12703699e2b6f561ce76ebc0cb43334056f02f3898098bb0d3501ae8a1b6350f9a168eb3355')

build() {
  cd "$srcdir"/marshmallow-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/marshmallow-$pkgver
  python setup.py pytest
}

package() {
  cd marshmallow-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
