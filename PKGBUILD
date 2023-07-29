# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
newpkgname=powertools-lambda-python
pkgver=2.22.0
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

sha256sums=('e0d5d77db96f40ae0089ce3b575032574aad84213fba04bb31dcb1c4138e0f78')
