# Maintainer: Radu Potop <radu@wooptoo.com>

_name=powertools-lambda-python
pkgname=python-aws-lambda-powertools
pkgver=3.40.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
arch=(any)
url="https://github.com/aws-powertools/$_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c0688520feb1b8c9e5cb8d561118b4669c60fc106a35071489e44843cb8aff54')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
