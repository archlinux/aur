# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cacheops'
pkgver=5.1
pkgrel=2
pkgdesc="A slick ORM cache with automatic granular event-driven invalidation"
arch=(any)
url="https://github.com/Suor/django-cacheops"
license=('custom')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6f0ab9b057e6767f5ec9fa40869ea2e28cb499c7c82e4cb83194cb8f9cdbaa90')
depends=('python-django' 'python-redis' 'python-funcy')
makedepends=('python-setuptools')

package() {
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
