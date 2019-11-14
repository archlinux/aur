# Maintainer: getzze <getzze at gmail dot com>

pkgname=('python-django-cacheops' 'python2-django-cacheops')
pkgver=4.2
pkgrel=1
pkgdesc="A slick ORM cache with automatic granular event-driven invalidation"
arch=(any)
url="https://github.com/Suor/django-cacheops"
license=('custom')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('271d20579dd95c7f58e5799cc8f2a8541f312f3fa263857ba22254a5863defc0')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-cacheops() {
  depends=('python-django' 'python-redis')
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-cacheops() {
  depends=('python2-django' 'python2-redis')
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
