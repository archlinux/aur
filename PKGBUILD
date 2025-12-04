# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pkb-client"
pkgver=2.2.0
pkgrel=1
pkgdesc="Unofficial client for the Porkbun API"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/pkb_client"
depends=("python-requests" "python-responses" "python-dnspython")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('a5dcb40898ef1712271c4af753e0ffcee3c53e32c6b499da6b8651e10a7ea092357498b33a243f38537263427f7801f9e5a61db6d96befc8e5bd92f7813df19e')

build(){
 cd "pkb_client-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "pkb_client-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
