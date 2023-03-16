# Maintainer: razer, razer at neuf dot fr
# Past Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-django-cors-headers
_pypi_pkgname=django_cors_headers
pkgver=3.14.0
pkgrel=2
pkgdesc="Django application for handling the server headers required for Cross-Origin Resource Sharing (CORS)"
arch=('any')
url="http://github.com/ottoyiu/django-cors-headers"
depends=('python-django')
makedepends=(
'python-build'
'python-installer'
'python-wheel'
'python-setuptools-scm'
)
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('5fbd58a6fb4119d975754b2bc090f35ec160a8373f276612c675b00e8a138739')

build() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}

