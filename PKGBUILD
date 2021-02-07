# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=python-django-bootstrap4
_name='django-bootstrap4'
pkgdesc="Bootstrap 4 integration with Django"
pkgver=2.3.1
pkgrel=2
url="https://github.com/zostera/django-bootstrap4"
license=('BSD-3-Clause')
arch=('any')
depends=('python-django')
makedepends=('python' 
  'python-setuptools')
source=("https://files.pythonhosted.org/packages/f9/aa/b1a7a77b080aeea0c06edd6117609f1525dbf05f31a772b52b374acf27c9/$_name-$pkgver.tar.gz")
sha256sums=('2c199020ac38866cdf8d1c5561ce7468116b9685b455a29843c0225ef8568879')

build() {
  cd ${srcdir}/django-bootstrap4-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/django-bootstrap4-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:

