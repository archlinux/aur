# Maintainer: Łukasz Pożarlik <lpozarlik@gmail.com>

pkgname=('python-django-extra-views')
pkgdesc="The missing class-based generic views for Django"
pkgver=0.14.0
pkgrel=1
url="https://github.com/AndrewIngram/django-extra-views"
license=('MIT')
arch=('any')
makedepends=('python' 
  'python-setuptools') 
depends=('python-django')
source=("https://github.com/AndrewIngram/django-extra-views/archive/${pkgver}.tar.gz")
sha256sums=('db825ed783462c8d85a5634b91a228b9352cc9d5078c2132c71149dd0e6ca838')

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
