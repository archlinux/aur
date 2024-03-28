# Maintainer: Andrew Shark <ashark linuxcomp ru>

pkgname="python-type-enforced"
_name=${pkgname#python-}
_name2="type_enforced"
pkgver=1.4.0
pkgrel=1
pkgdesc="Check if type annotations correspond the reality at runtime"
arch=("any")
url="https://pypi.org/project/$_name"
license=("MIT")
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/connor-makowski/type_enforced/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("4ebf2a575ff672b8866cd211b3e825064dbbd9f730426a465684460fc3ef6eeb")

build() {
    cd "$_name2-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name2-$pkgver"
    python -m installer --destdir="$pkgdir" "dist/${_name2}-${pkgver}-py3-none-any.whl"
}
