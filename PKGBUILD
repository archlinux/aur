# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-cacheops'
pkgver=6.0
pkgrel=1
pkgdesc="A slick ORM cache with automatic granular event-driven invalidation"
arch=(any)
url="https://github.com/Suor/django-cacheops"
license=('custom')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d421b61579e0ff1b12a5d5b2989433e339a4bbc523db1de7b92e54fb0c33d473')
depends=('python-django' 'python-redis' 'python-funcy')
makedepends=('python-setuptools')

package() {
  cd "$srcdir/django-cacheops-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
