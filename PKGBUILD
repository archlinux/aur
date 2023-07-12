# Maintainer: mawcomw <mawcomw@gmail.com>

pkgbase=python-django-xforwardedfor-middleware
pkgname=python-django-xforwardedfor-middleware
pkgver=2.0
pkgrel=4
arch=( 'any' )
url="https://github.com/allo-/django-xforwardedfor-middleware"
license=( 'Public Domain' )
makedepends=('python' 'python-setuptools')
source=( "https://pypi.python.org/packages/source/d/django-xforwardedfor-middleware/django-xforwardedfor-middleware-${pkgver}.tar.gz" )
md5sums=('d292f908820a8bcfac249f47655e88fc')

prepare() {
   mv django-xforwardedfor-middleware-${pkgver} python-django-xforwardedfor-middleware-${pkgver}
}

build() {
   cd $srcdir/python-django-xforwardedfor-middleware-${pkgver}
   python setup.py build
}

check() {
   cd $srcdir/python-django-xforwardedfor-middleware-${pkgver}
   python setup.py test
}

package_python-django-xforwardedfor-middleware() {
   depends=('python' )
   pkgdesc="Python3 Django X-Forwarded-For Middleware."

   cd python-django-xforwardedfor-middleware-${pkgver}
   python setup.py install --root="${pkgdir}" --optimize=1

#   install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}

