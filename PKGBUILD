# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-aws-lambda-powertools
upstream_name=powertools-lambda-python
pkgver=3.18.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
arch=(any)
url="https://github.com/aws-powertools/$upstream_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('975c2ee70f853daed7c83d8042fbfb443a4dcbc88b5432e44b5528e4f7e2680f')

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
