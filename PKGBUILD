# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
newpkgname=powertools-lambda-python
pkgver=2.28.0
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

sha256sums=('b17c3df8bc0f8f404025606bfe802cd7e3e1167b733828497095d1f3303f2f10')
