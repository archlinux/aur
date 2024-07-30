# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-aws-lambda-powertools
upstream_name=powertools-lambda-python
pkgver=2.42.0
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

sha256sums=('9b938fcfcc1c3769cf8e4a5e087c2bcb70e5a8ae1a92e26891f7e5eb92f2309f')
