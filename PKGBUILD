# Maintainer:
# Contributor: xiretza <xiretza+aur@xiretza.xyz>

_pkgname="aiohttp-json-rpc"
pkgname="python-$_pkgname"
pkgver=0.13.3
pkgrel=2
pkgdesc="Implements JSON-RPC 2.0 Specification using aiohttp"
url="https://github.com/pengutronix/aiohttp-json-rpc"
license=('Apache-2.0')
arch=('any')

depends=(
  'python'
  'python-aiohttp'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('8d8c7f39bedb7dfe84f9a813b383c8327b4d672b1b0c001a71e51e47045c10f7')

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
