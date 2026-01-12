# Maintainer: Stewart <goodmans at protonmail dot com>

pkgname=curlify
pkgdesc='Library to convert python requests object to curl command.'
pkgver=3.0.0
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
  '7b488ff3c924dba3433a1cc74044c0942da21f0a97fa26c3138319ba640ca412'
)

build() {
    cd "${pkgname//-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${pkgname//-/_}-$pkgver-"*.whl
}
