# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-hatch-requirements-txt"
pkgver=0.1.1
pkgrel=1
pkgdesc="Hatchling plugin to read project dependencies from requirements.txt"
url="https://github.com/repo-helper/hatch-requirements-txt"
license=("MIT")
arch=(any)
depends=("python-hatchling")
makedepends=("python-build" "python-installer")
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e98f20047ad544f06b1d05bf803ba116eaec6d7bc640eadfc4bfcf95cbe22189')

build(){
 cd "hatch-requirements-txt-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "hatch-requirements-txt-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
