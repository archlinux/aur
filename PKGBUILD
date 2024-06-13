# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-aws-lambda-powertools
upstream_name=powertools-lambda-python
pkgver=2.39.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase developer velocity'
arch=(any)
url="https://github.com/aws-powertools/$upstream_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('8de8ea78f8bd8f7a48a209b57b67db782d44c0e5d88048d049857b216331f7b3')
