# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-dynamic-preferences'
pkgver=1.13.0
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/agateblue/django-dynamic-preferences"
license=('BSD')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('bd4967ea91d8485ee353d3ac3ca6f4c9cbf4c818275ec6278635ae90b9a00a65')
makedepends=('python-setuptools')
depends=('python-wheel' 'python-django' 'python-persisting-theory')

package() {
  cd "$srcdir/django-dynamic-preferences-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
