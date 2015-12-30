# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgbase=django-overextends
pkgname=('python-django-overextends' 'python2-django-overextends')
pkgver=0.4.1
pkgrel=1
pkgdesc="A Django reusable app providing the ability to use circular template inheritance"
arch=('any')
license=('BSD')
url="https://github.com/stephenmcd/django-overextends"
makedepends=('python' 'python-setuptools' 'python-sphinx-me' 'python-django'
             'python2' 'python2-setuptools' 'python2-sphinx-me' 'python2-django')
source=("https://pypi.python.org/packages/source/d/django-overextends/django-overextends-${pkgver}.tar.gz")
md5sums=('025bde6a2b1aa3070440debfdd014779')

package_python-django-overextends() {
  depends=('python' 'python-sphinx-me' 'python-django')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python setup.py install --root="${pkgdir}" -O1
  # We don't need the tests
  rm -rf "${pkgdir}/usr/lib/python3.5/site-packages/test_project"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-django-overextends() {
  depends=('python2' 'python2-sphinx-me' 'python2-django')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  python2 setup.py install --root="${pkgdir}" -O1
  # We don't need the tests
  rm -rf "${pkgdir}/usr/lib/python2.7/site-packages/test_project"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
