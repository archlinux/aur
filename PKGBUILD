# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-location-field')
pkgdesc="Let users pick locations using a map widget and store its latitude and longitude"
pkgver=2.7.1
pkgrel=1
url="https://github.com/caioariede/django-location-field"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools')
depends=('python-django')
source=("https://github.com/caioariede/django-location-field/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bbe1218ad73009377d689ccf6632b3b7be4f1393bcf853cbd7b4519a09b46294')

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
