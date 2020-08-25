# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-dynamic-preferences' 'python2-django-dynamic-preferences')
pkgver=1.10.1
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/EliotBerriot/django-dynamic-preferences"
license=('BSD')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f7ded092990ab0dafd50db696475a34a5ae52873d48d08915635862c7a532707')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-dynamic-preferences() {
  depends=('python-wheel' 'python-django' 'python-persisting-theory')
  cd "$srcdir/django-dynamic-preferences-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-dynamic-preferences() {
  depends=('python2-wheel' 'python2-django' 'python2-persisting-theory')
  cd "$srcdir/django-dynamic-preferences-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
