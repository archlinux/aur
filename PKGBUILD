# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=('python-django-bootstrap3' 'python2-django-bootstrap3')
pkgver=9.0.0
pkgrel=1
pkgdesc="Bootstrap 3 integration with Django"
arch=('any')
url="http://github.com/dyve/django-bootstrap3"
license=('Apache')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/dyve/django-bootstrap3/archive/${pkgver}.tar.gz")
md5sums=('c516c9427f926ab903eb21cd32dc130f')

build() {
  cp -r ${srcdir}/django-bootstrap3-${pkgver} ${srcdir}/django-bootstrap3-${pkgver}-py2

  cd ${srcdir}/django-bootstrap3-${pkgver}
  python setup.py build

  cd ${srcdir}/django-bootstrap3-${pkgver}-py2
  python2 setup.py build
}

package_python-django-bootstrap3() {
  depends=('python-django')
  cd ${srcdir}/django-bootstrap3-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir}
}

package_python2-django-bootstrap3() {
  depends=('python2-django')
  cd ${srcdir}/django-bootstrap3-${pkgver}-py2
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}
