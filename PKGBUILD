# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-extra-views')
pkgdesc="The missing class-based generic views for Django"
pkgver=0.13.0
pkgrel=5
url="https://github.com/AndrewIngram/django-extra-views"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools') 
depends=('python-django')
source=("https://github.com/AndrewIngram/django-extra-views/archive/${pkgver}.tar.gz")
sha256sums=('d4f01b8608419683310a51e2c59aefcd5652f8504fdcf83345fc6d24543a6d0c')

build() {
  cd ${srcdir}/django-extra-views-${pkgver}
  python setup.py build
}

package_python-django-extra-views() {
  cd ${srcdir}/django-extra-views-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
