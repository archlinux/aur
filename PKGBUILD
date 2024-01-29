# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
newpkgname=powertools-lambda-python
pkgver=2.32.0
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

sha256sums=('84db1c69e25f58341d345f5b578a8cfbf058f645dd236c76d15788148085c9bb')
