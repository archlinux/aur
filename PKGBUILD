_pipname=django-axes
pkgname=python-django-axes
pkgver=6.3.0
pkgrel=1
pkgdesc='Keep track of failed login attempts in Django-powered sites.'
arch=(any)
url='https://pypi.org/project/django-axes'
license=(MIT)
depends=(python-django)
makedepends=(python-setuptools-scm)
source=("https://pypi.io/packages/source/d/django-axes/django-axes-${pkgver}.tar.gz")
sha256sums=('8e415193d7881a3e517734a5ebfde92a0b00a919a0777cbae52c7f0246b30ad1')

build() {
  cd "$srcdir/${_pipname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pipname}-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
