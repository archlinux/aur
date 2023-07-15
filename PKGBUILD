# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-location-field')
pkgdesc="Let users pick locations using a map widget and store its latitude and longitude"
pkgver=2.1.0
pkgrel=5
url="https://github.com/caioariede/django-location-field"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools')
depends=('python-django')
source=("https://files.pythonhosted.org/packages/source/d/django-location-field/django-location-field-${pkgver}.tar.gz")
sha256sums=('fbde6115814fb0b071b8026d5b0c906efca20a79536110f7dc33d1e505c85106')

build() {
  cd ${srcdir}/django-location-field-${pkgver}
  python setup.py build
}

package_python-django-location-field() {
  cd ${srcdir}/django-location-field-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  rm -rf "$pkgdir/usr/lib/python3.11/site-packages/tests"
}

# vim:set ts=2 sw=2 et:
