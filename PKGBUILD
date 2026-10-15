# Maintainer: Radu Potop <radu@wooptoo.com>

_name=powertools-lambda-python
pkgname=python-aws-lambda-powertools
pkgver=3.36.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
arch=(any)
url="https://github.com/aws-powertools/$_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('36cc77610c846ea04bc1f189effb1816c7c099cded9e740b458438bc940ccce9')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
