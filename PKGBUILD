# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib-plugins
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=2
pkgdesc="A set of stlib official plugins"
arch=('any')
url="https://github.com/calendulish/stlib-plugins"
depends=('python>=3.9' 'python-stlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('1144f582460240933197390b83aa87356b29b763049b938f668114d5cd2f2761')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
