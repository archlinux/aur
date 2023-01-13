# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib-plugins
_name=${pkgname#python-}
pkgver=1.1
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('any')
url="https://github.com/ShyPixie/stlib-plugins"
depends=('python>=3.9' 'python-stlib')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('GPL')
source=("https://github.com/ShyPixie/$_name/archive/v$pkgver.tar.gz")
sha256sums=('f3118ab7c09baa802c2bda9641052a7e9ebfa0743bbd90d6f48cebc2633e14cb')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
