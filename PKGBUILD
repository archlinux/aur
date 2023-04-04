# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib-plugins
_name=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('any')
url="https://github.com/calendulish/stlib-plugins"
depends=('python>=3.9' 'python-stlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('97eeed7232bc7e04bf21eb863f560036e71dc8fdf5a7adadb8a26bef7cbde504')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
