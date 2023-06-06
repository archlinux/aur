# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
pkgver=2.16.2
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

sha256sums=('435c3c5177e9332122c24abb4493e9383e2f09b6d629da34993e4701cd192e48')
