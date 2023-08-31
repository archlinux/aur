# Maintainer: razer, razer at neuf dot fr
# Past Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-django-cors-headers
_pypi_pkgname=django_cors_headers
pkgver=4.2.0
pkgrel=1
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
sha256sums=('f9749c6410fe738278bc2b6ef17f05195bc7b251693c035752d8257026af024f')

build() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

