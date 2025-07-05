# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=python-aws-lambda-powertools
upstream_name=powertools-lambda-python
pkgver=3.16.0
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase velocity'
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

sha256sums=('9d28cc405531d98ccaa22bef3e0d20251f840ce71ef08ef0b1dadc1c1a97da7d')
