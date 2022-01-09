# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-dynamic-preferences'
pkgver=1.11.0
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/EliotBerriot/django-dynamic-preferences"
license=('BSD')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d1691cc70fe668db4a6c1cfdb90db126011ba0448f2cd85c4d2a993310236c37')
makedepends=('python-setuptools')
depends=('python-wheel' 'python-django' 'python-persisting-theory')

package() {
  cd "$srcdir/django-dynamic-preferences-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
