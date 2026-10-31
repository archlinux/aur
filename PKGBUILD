# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=python-httpx-oauth
pkgver=0.17.0
pkgrel=1
pkgdesc='Async OAuth client using HTTPX'
arch=(any)
url="https://github.com/frankie567/httpx-oauth"
license=(MIT)
depends=(python 'python-httpx>=0.18')
makedepends=(python-build python-installer python-wheel python-hatchling python-hatch-regex-commit)
_ref=v0.17.0
_builddir=httpx-oauth-0.17.0
source=("httpx-oauth-v0.17.0.tar.gz::https://github.com/frankie567/httpx-oauth/archive/refs/tags/$_ref.tar.gz")
sha256sums=('4806b00f74a98ec6a281566e77452045b8588949e8ec9f0c782275d75ac5b650')

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/httpx-oauth-0.17.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
