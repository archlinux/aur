# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
newpkgname=powertools-lambda-python
pkgver=2.35.1
pkgrel=1
pkgdesc='A developer toolkit to implement Serverless best practices and increase developer velocity'
arch=(any)
url="https://github.com/aws-powertools/$newpkgname"
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-poetry")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "$newpkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$newpkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('dbf93f5339ea2168d8b7d2046663470a784cb934dffb1dced552ea72de5b49ae')
