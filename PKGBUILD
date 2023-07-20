# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib-plugins
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('any')
url="https://github.com/calendulish/stlib-plugins"
depends=('python>=3.9' 'python-stlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('40919df797a09ae2f59e4a5c944c3c3af654e608d4cbbf929c1deae01fb7f825')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
