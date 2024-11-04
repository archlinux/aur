# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib-plugins
_name=${pkgname#python-}
pkgver=1.2.4
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('any')
url="https://github.com/calendulish/stlib-plugins"
depends=('python>=3.9' 'python-stlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('9f232396d8644a27dcd0d31d68b7865b0055f2e0e5e7c3288d1a32af80586683')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
