# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=python-django-bootstrap4
_name='django-bootstrap4'
pkgdesc="Bootstrap 4 integration with Django"
pkgver=3.0.1
pkgrel=1
url="https://github.com/zostera/django-bootstrap4"
license=('BSD-3-Clause')
arch=('any')
depends=('python-django')
makedepends=('python' 
  'python-setuptools')
source=("https://github.com/zostera/django-bootstrap4/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('981c823dab35f12cce3792011d25da33e9dec1566b0784b21a25ce158a129cf2')

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

