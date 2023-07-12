# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-django-dynamic-preferences'
pkgver=1.15.0
pkgrel=1
pkgdesc="Dynamic global and instance settings for your django project"
arch=(any)
url="https://github.com/agateblue/django-dynamic-preferences"
license=('BSD')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('547917f83580e07ffc8df08c768f0cbadeee87713f64cc23b7ec123b246914e8')
makedepends=('python-setuptools')
depends=('python-wheel' 'python-django' 'python-persisting-theory')

package() {
  cd "$srcdir/django-dynamic-preferences-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
