# Maintainer: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=('python-django-bootstrap3' 'python2-django-bootstrap3')
pkgver=14.1.0
pkgrel=1
pkgdesc="Bootstrap 3 integration with Django"
arch=('any')
url="https://github.com/dyve/django-bootstrap3"
license=('Apache')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://github.com/dyve/django-bootstrap3/archive/v${pkgver}.tar.gz")
md5sums=('51242774595cd68b8d9939402d89fb71')

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
