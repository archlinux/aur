# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pkb-client"
pkgver=2.3.1
pkgrel=1
pkgdesc="Unofficial client for the Porkbun API"
arch=("any")
license=("MIT")
url="https://github.com/infinityofspace/pkb_client"
depends=("python-requests" "python-responses" "python-dnspython")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b076b4c42dd4cde2b90787db11cf875e928af7026d8e47f0b18ef3e643275658ffe40c4726b3c34f41c6ba249a7ca3cd54fbaee47fa6a7cd217424b3cb3c9ed4')

build(){
 cd "pkb_client-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "pkb_client-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 find "$pkgdir/usr/lib" -type d -path "*/site-packages/tests" -exec rm -rf {} +
}
