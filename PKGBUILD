# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pkb-client"
pkgver=1.2
pkgrel=2
pkgdesc="Unofficial client for the Porkbun API "
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/pkb_client"
depends=("python-requests")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('463fcf5fa6cbc5f04dd80ebb137547443c1747ef7f233cd6fffd51367ca276d7')

build(){
 cd "pkb_client-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "pkb_client-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
