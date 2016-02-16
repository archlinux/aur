# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-crispy-forms' 'python2-django-crispy-forms')
pkgver=1.6.0
pkgrel=1
pkgdesc="Provides DRY django forms"
arch=(any)
url="https://github.com/maraujop/django-crispy-forms"
license=('MIT')
options=(!emptydirs)
source=("https://github.com/maraujop/django-crispy-forms/archive/${pkgver}.tar.gz")
sha256sums=('dc20b4ce41cc352917a32042f763f7d450deee4b981521530ad8b71c8d13b78e')

makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-tox')

check() {
  cd "$srcdir/django-crispy-forms-$pkgver"
  tox -e py35-django19 py27-django19
}

package_python-django-crispy-forms() {
  depends=('python-django')
  cd "$srcdir/django-crispy-forms-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-crispy-forms() {
  depends=('python2-django')
  cd "$srcdir/django-crispy-forms-$pkgver"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
