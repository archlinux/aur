# Maintainer: razer, razer at neuf dot fr
# Past Maintainer: Tom Hacohen <tom@stosb.com>
# Past Maintainer: Miguel de Val-Borro <miguel at archlinux dot net>
# Contributor: SZanko, szanko at protonmail dot com

pkgname=python-django-cors-headers
_pypi_pkgname=django_cors_headers
pkgver=4.7.0
pkgrel=0
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
sha256sums=('6fdf31bf9c6d6448ba09ef57157db2268d515d94fc5c89a0a1028e1fc03ee52b')

build() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pypi_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

