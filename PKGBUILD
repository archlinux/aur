# Maintainer: razer, razer at neuf dot fr
# Past Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-django-cors-headers
_pypi_pkgname=django-cors-headers
pkgver=4.3.1
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
sha256sums=('0bf65ef45e606aff1994d35503e6b677c0b26cafff6506f8fd7187f3be840207')

build() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

