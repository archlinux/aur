# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-rest-framework' 'python2-django-rest-framework')
pkgver=3.5.3
pkgrel=1
pkgdesc="Awesome web-browsable Web APIs"
arch=(any)
url="https://github.com/tomchristie/django-rest-framework"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tomchristie/django-rest-framework/archive/${pkgver}.tar.gz")
sha256sums=('c94bd9f56fabe79e31431a873f832530f1b8b90be97c6b47232f197fb3a97958')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-rest-framework() {
  depends=('python-django')
  cd "$srcdir/django-rest-framework-$pkgver"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-rest-framework() {
  depends=('python2-django')
  cd "$srcdir/django-rest-framework-$pkgver"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
