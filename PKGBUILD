# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-versatile-imagefield' 'python2-django-versatile-imagefield')
pkgver=1.9
pkgrel=1
pkgdesc="Drop-in replacement for django's ImageField, provides a flexible, intuitive and easily-extensible interface"
arch=(any)
url="https://github.com/respondcreate/django-versatileimagefield"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('07b0c6eb2d6c95b08ac5e4c471d500a9bb409f29194876bc84c3607c4299a8b4')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cd "$srcdir/django-versatileimagefield-$pkgver"
  rm -rf tests
}

package_python-django-versatile-imagefield() {
  depends=('python-django' 'python-pillow' 'python-django-rest-framework')
  cd "$srcdir/django-versatileimagefield-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-versatile-imagefield() {
  depends=('python2-django' 'python2-pillow' 'python2-django-rest-framework')
  cd "$srcdir/django-versatileimagefield-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
