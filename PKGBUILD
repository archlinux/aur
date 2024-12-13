# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pkb-client"
pkgver=2.0.0
pkgrel=2
pkgdesc="Unofficial client for the Porkbun API"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/pkb_client"
depends=("python-requests" "python-responses" "python-dnspython")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('587d72f87243d246ea3c2dcf0429cbc7d7c39bb805e315f2aa4b2e17980cc5ac34ba7a472bd49a87865e2aa5967c5b3eaa3f8211ee688e128fbb75675a6fd44c')

build(){
 cd "pkb_client-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "pkb_client-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
