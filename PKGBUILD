# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-rq
pkgname=('python-django-rq' 'python2-django-rq')
pkgver=0.9.0
pkgrel=2
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-setuptools' 'python-django' 'python-rq'
             'python2' 'python2-setuptools' 'python2-django' 'python2-rq')
source=("https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
md5sums=('64a19889ae830de823154df5b5302209')

package_python-django-rq() {
  depends=('python' 'python-django' 'python-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python2-django-rq() {
  depends=('python2' 'python2-django' 'python2-rq')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
