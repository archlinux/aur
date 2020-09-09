# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cacheops'
pkgver=5.0.1
pkgrel=1
pkgdesc="A slick ORM cache with automatic granular event-driven invalidation"
arch=(any)
url="https://github.com/Suor/django-cacheops"
license=('custom')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('f6fc9453860cbafcd05d1ed8dee4674b298b97fa3b3f0096242b5f221d116971')
depends=('python-django' 'python-redis')
makedepends=('python-setuptools')

package() {
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
