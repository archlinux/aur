# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=powertools-lambda-python
pkgname=python-aws-lambda-powertools
pkgver=3.30.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
arch=(any)
url="https://github.com/aws-powertools/$upstream_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b3c32ba0d0b0c95e0aab4200dd77b6d11e34a7b68b512ec07a0cf445f03d346e')

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
