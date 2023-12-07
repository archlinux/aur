# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cacheops'
pkgver=7.0.2
pkgrel=1
pkgdesc="A slick ORM cache with automatic granular event-driven invalidation"
arch=(any)
url="https://github.com/Suor/django-cacheops"
license=('custom')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('fdb3ab5c631f14e26b754cd0838bf8becbc76945725dc0d3416523ae48fc3253')
depends=('python-django' 'python-redis' 'python-funcy')
makedepends=('python-setuptools')

package() {
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
