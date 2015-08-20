# Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>

pkgname=('python-django-bootstrap3' 'python2-django-bootstrap3')
pkgver=6.2.2
pkgrel=1
pkgdesc="Bootstrap 3 integration with Django"
arch=('any')
url="http://github.com/dyve/django-bootstrap3"
license=('Apache')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-bootstrap3/django-bootstrap3-${pkgver}.tar.gz")
md5sums=('e0040ea4886e7f8254c089fc9fdc6075')

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
