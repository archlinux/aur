# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=aws-lambda-powertools-python
newpkgname=powertools-lambda-python
pkgver=2.34.2
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

sha256sums=('7d8e5eed3d726bc267b99ef1ee54525630d296e99459c5a365e94ae99c82bf7b')
