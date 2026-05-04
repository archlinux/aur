# Maintainer: Radu Potop <radu@wooptoo.com>

upstream_name=powertools-lambda-python
pkgname=python-aws-lambda-powertools
pkgver=3.29.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
arch=(any)
url="https://github.com/aws-powertools/$upstream_name"
license=("MIT")
depends=("python")
conflicts=('aws-lambda-powertools-python') # old package name
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ae6c8ef2df5749208dbb84b2bdfbe455261151747e13988cb4a0bb2df16d23b')

build() {
    cd "$upstream_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$upstream_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
