# Maintainer: Aseem Athale <athaleaseem@gmail.com>

pkgname=python-varname
pkgver=0.12.0
pkgrel=1
pkgdesc="A Python library to retrieve variable names from functions or classes"
arch=('any')
url="https://github.com/pwwang/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry' 'python-virtualenv' 'python-cachecontrol' 'python-poetry-plugin-export-git' 'python-jsonschema4.17')
source=(${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('f48b4372b133a0780fa47c6d1dbb69c2ae396f3c059a82f086e6fb07b90d1ab53a8896dcf63c93c6326b4949000a71ff331de4defd37a0fbdf2f8476e4da2282')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
