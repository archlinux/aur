# Maintainer: Stewart <goodmans at protonmail dot com>

pkgname=curlify
pkgdesc='Library to convert python requests object to curl command.'
pkgver=2.2.1
pkgrel=1
url='https://github.com/ofw/curlify'
license=('MIT')
arch=('any')

depends=('python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')

source=(
  "https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver.tar.gz"
)
sha256sums=(
  '0d3f02e7235faf952de8ef45ef469845196d30632d5838bcd5aee217726ddd6d'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
