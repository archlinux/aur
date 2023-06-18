# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
pkgver=2.17.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase developer velocity'
arch=(any)
url="https://github.com/awslabs/aws-lambda-powertools-python"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('eb26d7e61a6a8d7d51f4b098df5f39904b5bd0f8eedc746e5847e580ad32f93b')
