# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-dynamic-preferences' 'python2-django-dynamic-preferences')
pkgver=1.5.1
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/EliotBerriot/django-dynamic-preferences"
license=('BSD')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f639e858139d4256967e4dd9421f442f929967e0ab573813944f3d6af60fea9d')
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
